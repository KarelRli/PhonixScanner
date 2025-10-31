import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
        children: [
          StreamBuilder<dynamic>(
            stream: Connectivity().onConnectivityChanged,
            builder: (context, snapshot) {
              final data = snapshot.data;
              ConnectivityResult result;
              if (data is ConnectivityResult) {
                result = data;
              } else if (data is List && data.isNotEmpty && data.first is ConnectivityResult) {
                result = data.first as ConnectivityResult;
              } else {
                result = ConnectivityResult.none;
              }
              final connected = result != ConnectivityResult.none;
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    connected ? Icons.wifi : Icons.wifi_off,
                    size: 20,
                    color: connected ? AppColors.white : AppColors.error,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    connected ? 'Connected' : 'No Connection',
                    style: TextStyle(color: connected ? AppColors.black : AppColors.error),
                  ),
                ],
              );
            },
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
              Text('-', style: TextStyle(color: AppColors.black)),
            ],
          ),
        ],
      ),
    );
  }
}