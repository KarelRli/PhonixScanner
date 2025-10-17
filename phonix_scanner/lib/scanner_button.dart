import 'package:flutter/material.dart';
import 'package:phonix_scanner/colors.dart';

class ScannerBtn extends StatelessWidget {
  const ScannerBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
      // TODO: activate scanner
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.white,
        foregroundColor: AppColors.black,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
      ),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          'Continue to Scanner',
          style: TextStyle(fontSize: 14),
        ),
        SizedBox(width: 16),
        Icon(Icons.arrow_forward),
      ],
      ),
    );
  }
}