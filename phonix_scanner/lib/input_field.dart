import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String suggestion;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;

  const InputField({
    Key? key,
    required this.suggestion,
    this.controller,
    this.onChanged,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(
        width: 1.0,
        color: Colors.grey,
      ),
    );

    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: suggestion,
        contentPadding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 14.0),
        enabledBorder: border,
        focusedBorder: border.copyWith(
          borderSide: const BorderSide(width: 1.0, color: Colors.blue),
        ),
      ),
    );
  }
}
