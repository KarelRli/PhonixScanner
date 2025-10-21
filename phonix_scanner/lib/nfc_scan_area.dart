import 'package:flutter/material.dart';
import 'package:phonix_scanner/colors.dart';
import 'package:dotted_border/dotted_border.dart';

class NfcScanArea extends StatefulWidget {
  final bool scanning;
  const NfcScanArea({super.key, required this.scanning});

  @override
  State<NfcScanArea> createState() => _NfcScanAreaState();
}

class _NfcScanAreaState extends State<NfcScanArea> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _scale;
  late final Animation<double> _rotate;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );
    _scale = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.08).chain(CurveTween(curve: Curves.easeInOut)), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.08, end: 1.0).chain(CurveTween(curve: Curves.easeInOut)), weight: 50),
    ]).animate(_ctrl);
    _rotate = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: -0.04, end: 0.04).chain(CurveTween(curve: Curves.easeInOut)), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 0.04, end: -0.04).chain(CurveTween(curve: Curves.easeInOut)), weight: 50),
    ]).animate(_ctrl);

    if (widget.scanning) {
      _ctrl.repeat();
    }
  }

  @override
  void didUpdateWidget(covariant NfcScanArea oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scanning != widget.scanning) {
      if (widget.scanning) {
        _ctrl.repeat();
      } else {
        _ctrl.stop();
        _ctrl.reset();
      }
    }
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: Radius.circular(16.0),
        dashPattern: [6, 4],
        strokeWidth: 2.0,
        color: AppColors.white50,
      ),
      child: Container(
        padding: const EdgeInsets.all(40.0),
        decoration: BoxDecoration(
          color: AppColors.white10,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              fit: FlexFit.loose,
              child: Center(
                child: AnimatedBuilder(
                  animation: _ctrl,
                  builder: (context, child) {
                    final scale = widget.scanning ? _scale.value : 1.0;
                    final rotation = widget.scanning ? _rotate.value : 0.0;
                    return Transform.rotate(
                      angle: rotation,
                      child: Transform.scale(
                        scale: scale,
                        child: child,
                      ),
                    );
                  },
                  child: _buildImagePlaceholder(),
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Ready to scan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            const Text(
              'Tap the button below and hold your Burner.pro card near your device',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 13, color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return SizedBox(
      width: 96,
      height: 96,
      child: Image.asset(
        'assets/images/phoenix.png',
        fit: BoxFit.contain,
      ),
    );
  }
}
