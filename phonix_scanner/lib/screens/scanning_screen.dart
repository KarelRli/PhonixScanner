import 'package:flutter/material.dart';
import 'package:phonix_scanner/colors.dart';
import 'package:phonix_scanner/input_field.dart';
import 'package:phonix_scanner/logo.dart';

class ScanningScreen extends StatelessWidget {
  const ScanningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 50),
            const Logo(size: 75, isAnimated: true),
            const SizedBox(height: 20),
            const Text(
              'Membership Scan',
              style: TextStyle(
                fontSize: 24,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Configure the NFT contract to verify',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SizedBox(
                width: double.infinity,
                child: InputField(suggestion: 'e.g., VIP Membership Pass'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}