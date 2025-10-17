import 'package:flutter/material.dart';
import 'package:phonix_scanner/colors.dart';
import 'package:phonix_scanner/input_field.dart';
import 'package:phonix_scanner/input_field_title.dart';
import 'package:phonix_scanner/drop_down.dart';
import 'package:phonix_scanner/blockchain_networks.dart';

class ConfigurationBlock extends StatelessWidget {
  const ConfigurationBlock({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white10,
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: AppColors.white30,
          width: 1.0,
        ),
      ),
      //margin: const EdgeInsets.symmetric(horizontal: 24.0),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InputFieldTitle('Contract Name (Optional)'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: InputField(suggestion: 'e.g., VIP Membership Pass'),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InputFieldTitle('Blockchain Network'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: DropDownField(suggestion: 'Select blockchain', items: [
                BlockchainNetworks.ethereumMainnet,
                BlockchainNetworks.polygon,
                BlockchainNetworks.optimism,
                BlockchainNetworks.arbitrumOne,
                BlockchainNetworks.base,
                BlockchainNetworks.gnosisChain,
              ], onChanged: (value) {},),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InputFieldTitle('Smart Contract Address'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: InputField(suggestion: '0x...'),
            ),
          ]
        ),
      ),
    );
  }
}