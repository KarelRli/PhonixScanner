import 'package:flutter/material.dart';
import 'package:phonix_scanner/secondary_box.dart';
import 'package:phonix_scanner/colors.dart';

class AppStatusBox extends StatelessWidget {
  const AppStatusBox({super.key});

  @override
  Widget build(BuildContext context) {
    return SecondaryBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.wifi, size: 20, color: AppColors.white),
              SizedBox(width: 8),
              Text('Connected', style: TextStyle(color: AppColors.black)),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.shield_outlined, size: 20, color: AppColors.white),
              SizedBox(width: 8),
              Text('Secure', style: TextStyle(color: AppColors.black)),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.access_time, size: 20, color: AppColors.white),
              SizedBox(width: 8),
              Text('Live', style: TextStyle(color: AppColors.black)),
            ],
          ),
        ],
      ),
    );
  }
}