import 'package:flutter/material.dart';
import 'package:phonix_scanner/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsModel extends ChangeNotifier {
  static const _kBackgroundColorKey = 'background_color';

  Color _backgroundColor = AppColors.backgroundPrimary;

  SettingsModel() {
    _load();
  }

  Color get backgroundColor => _backgroundColor;

  Future<void> _load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final colorValue = prefs.getInt(_kBackgroundColorKey);
      if (colorValue != null) {
        _backgroundColor = Color(colorValue);
        notifyListeners();
      }
    } catch (_) {
      // ignore errors and keep default
    }
  }

  Future<void> setBackgroundColor(Color color) async {
    _backgroundColor = color;
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(_kBackgroundColorKey, color.value);
    } catch (_) {
      // ignore persistence errors
    }
  }
}
