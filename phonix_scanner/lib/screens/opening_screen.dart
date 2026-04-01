import 'package:flutter/material.dart';
import 'package:phonix_scanner/colors.dart';
import 'package:phonix_scanner/footer.dart';
import 'package:phonix_scanner/logo.dart';
import 'package:phonix_scanner/hyperlink.dart';
import 'package:phonix_scanner/screens/settings_screen.dart';
import 'package:phonix_scanner/widgets/background_animation.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({super.key});

  Future<void> _openSettingsSheet(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      backgroundColor: Colors.transparent,
      builder: (_) => SizedBox(
        height: screenHeight * 0.8,
        child: const SettingsScreen(isBottomSheet: true),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: AppColors.font),
            onPressed: () => _openSettingsSheet(context),
          ),
        ],
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: BackgroundAnimation(
        baseColor: Theme.of(context).scaffoldBackgroundColor,
        glowColor: AppColors.fontHighlight,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Logo(
                size: 120,
                isAnimated: true,
                action: () => Navigator.pushNamed(context, '/configuration'),
              ),
              const SizedBox(height: 20),
              const Text(
                'PHOENIX GATE',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: AppColors.fontHighlight,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Verify your Memberships',
                style: TextStyle(fontSize: 16, color: AppColors.font),
              ),
              const SizedBox(height: 10),
              const Text(
                'Powered By',
                style: TextStyle(fontSize: 12, color: AppColors.font),
              ),
              const SizedBox(height: 10),
              Hyperlink(
                text: 'Unlock Protocol',
                url: 'https://unlock-protocol.com/',
                color: AppColors.fontHighlight,
              ),
              const SizedBox(height: 10),
              Hyperlink(
                text: 'Burner.pro',
                url: 'https://www.burner.pro/',
                color: AppColors.fontHighlight,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Footer(),
    );
  }
}
