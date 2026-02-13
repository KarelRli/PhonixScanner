import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:phonix_scanner/colors.dart';
import 'package:phonix_scanner/models/contract_model.dart';
import 'package:phonix_scanner/models/settings_model.dart';
import 'package:phonix_scanner/screens/opening_screen.dart';
import 'package:phonix_scanner/screens/configuration_screen.dart';
import 'package:phonix_scanner/screens/scanning_screen.dart';
import 'package:phonix_scanner/screens/settings_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ContractModel()),
        ChangeNotifierProvider(create: (_) => SettingsModel()),
      ],
      child: const PhonixScanner(),
    ),
  );
}

class PhonixScanner extends StatelessWidget {
  const PhonixScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsModel>(
      builder: (context, settings, child) {
        return MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => OpeningScreen(),
            '/configuration': (context) => ConfigurationScreen(),
            '/scanning': (context) => ScanningScreen(),
            '/settings': (context) => const SettingsScreen(),
          },
          theme: ThemeData(
            scaffoldBackgroundColor: settings.backgroundColor,
            textTheme: GoogleFonts.robotoTextTheme(),
            primaryTextTheme: GoogleFonts.robotoTextTheme(),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: AppColors.fontHighlight,
              selectionColor: AppColors.fontHighlight,
              selectionHandleColor: AppColors.fontHighlight,
            ),
          ),
        );
      },
    );
  }
}
