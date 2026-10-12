import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prj3/views/app_colors.dart';

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    required this.icon,
    required this.text,
    required this.colors,
    this.isSize = false,
    this.isMode = false,
    this.isDarkMode = false,
    this.onTap,
    this.toggleKey,
  });

  final String icon;
  final String text;
  final bool isSize;
  final bool isMode;
  final bool isDarkMode;
  final VoidCallback? onTap;
  final GlobalKey? toggleKey;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
              decoration: BoxDecoration(
                color: colors.iconBackground,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SvgPicture.asset(
                icon,
                colorFilter: ColorFilter.mode(
                  colors.iconColor,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(width: 15),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.normal,
                color: colors.primaryText,
              ),
            ),
          ],
        ),
        if (isMode)
          AnimatedThemeToggle(
            key: toggleKey,
            isDarkMode: isDarkMode,
            onTap: onTap ?? () {},
          )
        else if (isSize)
          Row(
            children: [
              Text(
                'Medium',
                style: TextStyle(fontSize: 15, color: colors.primaryText),
              ),
              const SizedBox(width: 20),
              SvgPicture.asset(
                'assets/images/Vector-1.svg',
                colorFilter: ColorFilter.mode(
                  colors.iconColor,
                  BlendMode.srcIn,
                ),
              ),
            ],
          )
        else
          SvgPicture.asset(
            'assets/images/Vector-1.svg',
            colorFilter: ColorFilter.mode(colors.iconColor, BlendMode.srcIn),
          ),
      ],
    );
  }
}

class AnimatedThemeToggle extends StatelessWidget {
  const AnimatedThemeToggle({
    super.key,
    required this.isDarkMode,
    required this.onTap,
  });

  final bool isDarkMode;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOutCubic,
        width: 62,
        height: 34,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isDarkMode ? const Color(0xFF355E3B) : const Color(0xFFE9E9E9),
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 350),
          curve: Curves.easeInOutBack,
          alignment: isDarkMode ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 26,
            height: 26,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: const Color(0xFFFAF9F6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 250),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: RotationTransition(turns: animation, child: child),
                );
              },
              child: Icon(
                isDarkMode ? Icons.nightlight_round : Icons.wb_sunny_rounded,
                key: ValueKey(isDarkMode),
                size: 16,
                color: isDarkMode
                    ? const Color(0xFF355E3B)
                    : const Color(0xFFFFA726),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
