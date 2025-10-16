import 'package:flutter/material.dart';
import 'package:phonix_scanner/screens/opening_screen.dart';
import 'package:phonix_scanner/screens/scanning_screen.dart';

void main() {
  runApp(const PhonixScanner());
}

class PhonixScanner extends StatelessWidget {
  const PhonixScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => OpeningScreen(),
        '/scanning': (context) => ScanningScreen(),
      },
    );
  }
}
