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
  });

  final String icon;
  final String text;
  final bool isSize;
  final bool isMode;
  final bool isDarkMode;
  final VoidCallback? onTap;
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
          Switch(
            value: isDarkMode,
            onChanged: (_) => onTap?.call(),
            activeTrackColor: colors.switchActive,
            inactiveTrackColor: colors.switchInactive,
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
