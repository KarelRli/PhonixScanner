import 'package:flutter/material.dart';
import 'package:phonix_scanner/colors.dart';

class TextBox extends StatelessWidget {
  const TextBox(this.text, this.alignment, {super.key});

  final String text;
  final TextAlign alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: AppColors.white05,
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: AppColors.white10,
          width: 1.0,
        ),
      ),
      child: Text(
        text,
        textAlign: alignment,
        style: const TextStyle(
          fontSize: 14.0,
          color: AppColors.black,
        ),
      ),
    );
  }
}