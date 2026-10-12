import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prj3/views/app_colors.dart';
import 'package:prj3/views/setting_card.dart';
import 'package:prj3/views/setting_item.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final colors = AppColors(isDarkMode);

    return Scaffold(
      backgroundColor: colors.background,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: colors.surface,
            child: Column(
              children: [
                const SizedBox(height: 66),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/sharp-arrow-back.svg',
                        colorFilter: ColorFilter.mode(
                          colors.iconColor,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                          color: colors.primaryText,
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/images/notification-fill.svg',
                        colorFilter: ColorFilter.mode(
                          colors.iconColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 21),

                    SettingCard(
                      title: 'ACCOUNT',
                      item1: 'Edit Profile',
                      item2: 'Change Password',
                      icon1: 'assets/images/Vector-2.svg',
                      icon2: 'assets/images/Vector.svg',
                      colors: colors,
                    ),

                    const SizedBox(height: 26),

                    Text(
                      'APPEARANCE',
                      style: TextStyle(
                        fontSize: 17,
                        color: colors.secondaryText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: colors.surface,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 16),
                            blurRadius: 32,
                            spreadRadius: -4,
                            color: colors.shadowColor,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 21,
                        horizontal: 18,
                      ),
                      child: Column(
                        children: [
                          SettingItem(
                            icon: 'assets/images/Vector-3.svg',
                            text: 'Dark Mode',
                            isMode: true,
                            isDarkMode: isDarkMode,
                            colors: colors,
                            onTap: () {
                              setState(() {
                                isDarkMode = !isDarkMode;
                              });
                            },
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 19),
                            child: Divider(
                              thickness: 0.5,
                              color: colors.divider,
                            ),
                          ),

                          SettingItem(
                            icon: 'assets/images/Vector-4.svg',
                            text: 'Text Size',
                            isSize: true,
                            colors: colors,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 26),

                    Text(
                      'SUPPORT',
                      style: TextStyle(
                        fontSize: 17,
                        color: colors.secondaryText,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 15),

                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: colors.surface,
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 16),
                            blurRadius: 32,
                            spreadRadius: -4,
                            color: colors.shadowColor,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 21,
                        horizontal: 18,
                      ),
                      child: Column(
                        children: [
                          SettingItem(
                            icon: 'assets/images/Vector (1).svg',
                            text: 'Help Center',
                            colors: colors,
                          ),

                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 19),
                            child: Divider(
                              thickness: 0.5,
                              color: colors.divider,
                            ),
                          ),

                          SettingItem(
                            icon: 'assets/images/Vector-1 (1).svg',
                            text: 'Report a Bug',
                            colors: colors,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
