import 'package:flutter/material.dart';

import '../utils/styles/app_colors.dart';

class ReusableIconButton extends StatelessWidget {
  const ReusableIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.color,
    this.splashColor,
  });

  /// Callback function to be executed when the button is tapped
  final GestureTapCallback onTap;

  /// Icon to be displayed on the button
  final IconData icon;

  /// Color of the icon
  final Color? color;

  /// Splash color of the button
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      splashRadius: 15,
      splashColor: splashColor ?? AppColors.accent,
      icon: Icon(
        icon,
        color: color ?? AppColors.medium,
      ),
    );
  }
}
