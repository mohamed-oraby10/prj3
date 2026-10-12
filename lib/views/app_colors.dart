import 'package:flutter/material.dart';

class AppColors {
  final Color background;
  final Color surface;
  final Color primaryText;
  final Color secondaryText;
  final Color iconColor;
  final Color iconBackground;
  final Color divider;
  final Color shadowColor;
  final Color switchActive;
  final Color switchInactive;

  AppColors(bool isDarkMode)
    : background = isDarkMode
          ? const Color(0xFF121212)
          : const Color(0xFFF8F8F8),
      surface = isDarkMode ? const Color(0xFF1E1E1E) : Colors.white,
      primaryText = isDarkMode ? Colors.white : const Color(0xFF171717),
      secondaryText = isDarkMode
          ? const Color(0xFFB0B0B0)
          : const Color(0xFF6B6B6B),
      iconColor = isDarkMode ? Colors.white : Colors.black,
      iconBackground = isDarkMode
          ? const Color(0xFF353535)
          : const Color(0xFFE9E9E9),
      divider = isDarkMode ? const Color(0xFF383838) : const Color(0xFFEBEBEB),
      shadowColor = isDarkMode ? Colors.black26 : const Color(0x190C0C0D),
      switchActive = isDarkMode
          ? const Color(0xFF355E3B)
          : const Color(0xFFFAF9F6),
      switchInactive = isDarkMode
          ? const Color(0xFF355E3B)
          : const Color(0xFFFAF9F6);
}
