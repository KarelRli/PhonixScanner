import 'package:flutter/material.dart';
import 'package:phonix_scanner/models/blockchain_networks.dart';
import 'package:phonix_scanner/colors.dart';
import 'package:phonix_scanner/secondary_box.dart';

class ContractDataBox extends StatelessWidget {
  const ContractDataBox({super.key, required this.blockchain, required this.address});

  final BlockchainNetworks blockchain;
  final String address;

  String _shortenAddress(String addr) {
    if (addr.length <= 10) return addr;
    return '${addr.substring(0, 6)}...${addr.substring(addr.length - 4)}';
  }

  @override
  Widget build(BuildContext context) {
    return SecondaryBox(child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(Icons.check_circle_outline_outlined, color: AppColors.fontHighlight, size: 18),
                SizedBox(width: 6),
                Text(
                  "Contract Active",
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.font,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _shortenAddress(address),
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.font
                  ),
                ),
                Text(
                  blockchain.name,
                  style: const TextStyle(
                    fontSize: 12,
                    color: AppColors.font
                  ),
                ),
              ],
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/configuration');
          },
          child: const Icon(Icons.settings_outlined, size: 18, color: AppColors.font),
        ),
      ],
    ));
  }
}