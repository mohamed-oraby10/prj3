import 'package:flutter/material.dart';
import 'package:prj3/views/app_colors.dart';
import 'package:prj3/views/setting_item.dart';

class SettingCard extends StatelessWidget {
  const SettingCard({
    super.key,
    required this.title,
    required this.item1,
    required this.item2,
    required this.icon1,
    required this.icon2,
    required this.colors,
  });

  final String title;
  final String item1;
  final String item2;
  final String icon1;
  final String icon2;
  final AppColors colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
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
          padding: const EdgeInsets.symmetric(vertical: 21, horizontal: 18),
          child: Column(
            children: [
              SettingItem(icon: icon1, text: item1, colors: colors),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 19),
                child: Divider(thickness: 0.5, color: colors.divider),
              ),
              SettingItem(icon: icon2, text: item2, colors: colors),
            ],
          ),
        ),
      ],
    );
  }
}
