import 'dart:math' as math;

import 'package:flutter/material.dart';

class ThemeRevealClipper extends CustomClipper<Path> {
  final double progress;
  final Offset center;

  const ThemeRevealClipper({required this.progress, required this.center});

  @override
  Path getClip(Size size) {
    final corners = [
      Offset.zero,
      Offset(size.width, 0),
      Offset(0, size.height),
      Offset(size.width, size.height),
    ];

    double maxRadius = 0;

    for (final corner in corners) {
      maxRadius = math.max(maxRadius, (corner - center).distance);
    }

    final radius = maxRadius * progress;

    return Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  }

  @override
  bool shouldReclip(covariant ThemeRevealClipper oldClipper) {
    return oldClipper.progress != progress || oldClipper.center != center;
  }
}
