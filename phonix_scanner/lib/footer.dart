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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Created by ',
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
              ],
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'This project is licenced under the ',
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.font,
                  ),
                ),
                Hyperlink(
                  text: 'MIT licence',
                  url: 'https://opensource.org/license/mit',
                  color: AppColors.font,
                  size: 12,
                ),
              ],
            )
          ],
        ),
        
      ),
    );
  }
}
