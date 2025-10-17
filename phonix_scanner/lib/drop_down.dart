import 'package:flutter/material.dart';
import 'package:phonix_scanner/colors.dart';

class DropDownField<T> extends StatelessWidget {
  final String suggestion;
  final T? value;
  final List<T> items;
  final ValueChanged<T?>? onChanged;
  final Widget? icon;
  final String Function(T)? toStringFn;

  const DropDownField({
    super.key,
    required this.suggestion,
    required this.items,
    this.value,
    this.onChanged,
    this.icon,
    this.toStringFn,
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

    return SizedBox(
      width: double.infinity,
      child: DropdownButtonFormField<T>(
        isExpanded: true,
        initialValue: value,
        onChanged: onChanged,
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
          suffixIcon: icon ?? const Icon(Icons.arrow_drop_down, color: AppColors.white30),
        ),
        items: items.map((T item) {
          final label = toStringFn != null ? toStringFn!(item) : item.toString();
          return DropdownMenuItem<T>(
            value: item,
            child: Text(label),
          );
        }).toList(),
      )
    );
  }
}
