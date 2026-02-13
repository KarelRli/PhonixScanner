import 'package:flutter/material.dart';
import 'package:phonix_scanner/colors.dart';

class InputFieldTitle extends StatelessWidget {
  const InputFieldTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.font,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}