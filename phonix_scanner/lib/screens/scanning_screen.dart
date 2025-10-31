import 'package:flutter/material.dart';
import 'package:phonix_scanner/app_status_box.dart';
import 'package:phonix_scanner/models/blockchain_networks.dart';
import 'package:phonix_scanner/colors.dart';
import 'package:phonix_scanner/contract_data_box.dart';
import 'package:phonix_scanner/event_data_box.dart';
import 'package:phonix_scanner/logo.dart';
import 'package:phonix_scanner/nfc_scan_area.dart';
import 'package:phonix_scanner/primary_button.dart';
import 'package:phonix_scanner/scan_instructions.dart';
import 'package:phonix_scanner/hyperlink.dart';
import 'package:provider/provider.dart';
import 'package:phonix_scanner/models/contract_model.dart';

class ScanningScreen extends StatefulWidget {
  const ScanningScreen({super.key});

  @override
  State<ScanningScreen> createState() => _ScanningScreenState();
}

class _ScanningScreenState extends State<ScanningScreen> {
  bool isScanning = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 50),
                const Logo(size: 75, isAnimated: true),

                const SizedBox(height: 20),
                const Text(
                  'Event Access',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 20),
                const Text(
                  'Verify NFT membership with NFC scan',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.black,
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: EventDataBox(),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Consumer<ContractModel>(
                    builder: (context, model, child) {
                      return ContractDataBox(
                        contractName: model.name,
                        blockchain: model.blockchain ?? BlockchainNetworks.ethereumMainnet,
                        address: model.contractAddress
                      );
                    },
                  ),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: const AppStatusBox(),
                ),

                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: NfcScanArea(scanning: isScanning),
                ),

                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: PrimaryButton(
                    "Start NFC Scan",
                    () {
                      setState(() {
                        isScanning = true;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: const ScanningInstructions(),
                ),

                const SizedBox(height: 36.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Powered By ',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                    Hyperlink(
                      text: 'Unlock Protocol',
                      url: 'https://unlock-protocol.com/',
                      color: AppColors.black,
                    ),
                    const Text(
                      ' x ',
                      style: TextStyle(
                        fontSize: 14,
                        color: AppColors.black,
                      ),
                    ),
                    Hyperlink(
                      text: 'Burner.pro',
                      url: 'https://www.burner.pro/',
                      color: AppColors.black,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}