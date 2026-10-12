import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:prj3/views/app_colors.dart';
import 'package:prj3/views/setting_card.dart';
import 'package:prj3/views/setting_item.dart';
import 'package:prj3/views/theme_reveal_clipper.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView>
    with SingleTickerProviderStateMixin {
  bool isDarkMode = false;
  bool? targetDarkMode;

  late final AnimationController _controller;

  final GlobalKey _toggleKey = GlobalKey();
  final GlobalKey _stackKey = GlobalKey();

  Offset _revealCenter = Offset.zero;

  bool get _isAnimating => targetDarkMode != null;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 850),
    );

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed && mounted) {
        setState(() {
          isDarkMode = targetDarkMode!;
          targetDarkMode = null;
        });

        _controller.reset();
      }
    });
  }

  void _toggleTheme() {
    if (_isAnimating) return;

    final toggleContext = _toggleKey.currentContext;
    final stackContext = _stackKey.currentContext;

    if (toggleContext == null || stackContext == null) return;

    final toggleBox = toggleContext.findRenderObject() as RenderBox?;
    final stackBox = stackContext.findRenderObject() as RenderBox?;

    if (toggleBox == null || stackBox == null) return;

    final toggleCenterGlobal = toggleBox.localToGlobal(
      Offset(toggleBox.size.width / 2, toggleBox.size.height / 2),
    );

    final center = stackBox.globalToLocal(toggleCenterGlobal);

    setState(() {
      _revealCenter = center;
      targetDarkMode = !isDarkMode;
    });

    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            key: _stackKey,
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                child: _buildSettingsContent(
                  isDarkMode: isDarkMode,
                  useToggleKey: !_isAnimating,
                ),
              ),

              if (_isAnimating)
                Positioned.fill(
                  child: ClipPath(
                    clipper: ThemeRevealClipper(
                      progress: Curves.easeInOutCubic.transform(
                        _controller.value,
                      ),
                      center: _revealCenter,
                    ),
                    child: _buildSettingsContent(
                      isDarkMode: targetDarkMode!,
                      useToggleKey: false,
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildSettingsContent({
    required bool isDarkMode,
    required bool useToggleKey,
  }) {
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

                    _buildCard(
                      colors: colors,
                      child: Column(
                        children: [
                          SettingItem(
                            icon: 'assets/images/Vector-3.svg',
                            text: 'Dark Mode',
                            isMode: true,
                            isDarkMode: isDarkMode,
                            colors: colors,
                            toggleKey: useToggleKey ? _toggleKey : null,
                            onTap: useToggleKey ? _toggleTheme : null,
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

                    _buildCard(
                      colors: colors,
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

  Widget _buildCard({required AppColors colors, required Widget child}) {
    return Container(
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
      child: child,
    );
  }
}
