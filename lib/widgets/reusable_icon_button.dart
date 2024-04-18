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

  final GestureTapCallback onTap;
  final IconData icon;
  final Color? color;
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
