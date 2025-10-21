import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:ui';

class LiquidGlassCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final bool showDottedBorder; // ✅ make border optional
  final Color borderColor;
  final double borderRadius;
  final double blurIntensity;

  const LiquidGlassCard({
    super.key,
    required this.child,
    this.padding,
    this.showDottedBorder = false, // default: no dotted border
    this.borderColor = const Color(0x33FFFFFF),
    this.borderRadius = 20,
    this.blurIntensity = 20,
  });

  @override
  Widget build(BuildContext context) {
    final card = ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurIntensity, sigmaY: blurIntensity),
        child: Container(
          width: double.infinity,
          padding: padding ?? const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: child,
        ),
      ),
    );

    // ✅ If dotted border is requested, wrap with DottedBorder
    if (showDottedBorder) {
      return DottedBorder(
        color: borderColor,
        dashPattern: const [6, 3],
        strokeWidth: 1.2,
        borderType: BorderType.RRect,
        radius: Radius.circular(borderRadius),
        padding: EdgeInsets.zero,
        child: card,
      );
    }

    return card;
  }
}
