import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:phonix_scanner/colors.dart';
import 'package:phonix_scanner/models/settings_model.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  static const _availableColors = [
    AppColors.backgroundPrimary,
    AppColors.white,
    AppColors.black,
    AppColors.eventIcon,
    AppColors.green,
    Color(0xFF1E1B3A),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: const IconThemeData(color: AppColors.font),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Settings',
              style: TextStyle(color: AppColors.font, fontSize: 24),
            ),
            const SizedBox(height: 20),
            const Text(
              'Background color',
              style: TextStyle(color: AppColors.font, fontSize: 16),
            ),
            const SizedBox(height: 12),
            Consumer<SettingsModel>(
              builder: (context, settings, child) {
                return Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: _availableColors.map((color) {
                    final selected = settings.backgroundColor.toARGB32() == color.toARGB32();
                    return GestureDetector(
                      onTap: () => settings.setBackgroundColor(color),
                      child: Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(8),
                          border: selected ? Border.all(color: AppColors.fontHighlight, width: 3) : Border.all(color: AppColors.white10),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
            const SizedBox(height: 48),
            const Text(
              'Credits',
              style: TextStyle(
                color: AppColors.font,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),

            Column(
              children: const [
                _CreditTile(
                  name: 'Alice Johnson',
                  role: 'Lead Developer',
                  contact: 'alice.johnson@example.com',
                  isEmail: true,
                ),
                _CreditTile(
                  name: 'Bob Smith',
                  role: 'UX Designer',
                  contact: '+1 555-123-4567',
                  isEmail: false,
                ),
                _CreditTile(
                  name: 'Carla Mendes',
                  role: 'QA Engineer',
                  contact: 'carla.mendes@example.com',
                  isEmail: true,
                ),
                _CreditTile(
                  name: 'Daniel K.',
                  role: 'Project Manager',
                  contact: '+44 7700 900123',
                  isEmail: false,
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class _CreditTile extends StatelessWidget {
  final String name;
  final String role;
  final String contact;
  final bool isEmail;

  const _CreditTile({
    required this.name,
    required this.role,
    required this.contact,
    required this.isEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white10,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.white10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.backgroundPrimary,
            child: Text(
              name[0],
              style: const TextStyle(
                color: AppColors.fontHighlight,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: AppColors.font,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  role,
                  style: const TextStyle(
                    color: AppColors.font,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      isEmail ? Icons.email_outlined : Icons.phone_outlined,
                      size: 16,
                      color: AppColors.fontHighlight,
                    ),
                    const SizedBox(width: 6),
                    Flexible(
                      child: Text(
                        contact,
                        style: const TextStyle(
                          color: AppColors.fontHighlight,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

