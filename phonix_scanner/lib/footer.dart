import 'package:flutter/material.dart';
import 'package:phonix_scanner/colors.dart';
import 'package:phonix_scanner/hyperlink.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: AppColors.font.withAlpha(30),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              'By ',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.font,
              ),
            ),
            Hyperlink(
              text: 'The Alana Project',
              url: 'https://the-alana-project.xyz/',
              color: AppColors.font,
              size: 12,
            ),
            SizedBox(width: 4),
            Text(
              '•',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.font,
              ),
            ),
            SizedBox(width: 4),
            Text(
              'MIT',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.font,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
