import 'package:flutter/material.dart';
import 'package:phonix_scanner/colors.dart';

class InputField extends StatelessWidget {
  final String suggestion;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;

  const InputField({
    super.key,
    required this.suggestion,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        width: 1.0,
        color: AppColors.white30,
      ),
    );

    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.white30,
        hintText: suggestion,
        hintStyle: const TextStyle(color: AppColors.hint),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(width: 1.0, color: AppColors.white),
        ),
      ),
    );
  }
}
