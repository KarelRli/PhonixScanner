import 'package:flutter/material.dart';
import 'package:phonix_scanner/colors.dart';

class BackBtn extends StatelessWidget {
  const BackBtn(this.route, {super.key});

  final String route;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, route);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.black,
        elevation: 0,
        side: const BorderSide(color: AppColors.white30, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            'Back',
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}