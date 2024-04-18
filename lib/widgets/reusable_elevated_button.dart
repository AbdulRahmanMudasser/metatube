import 'package:flutter/material.dart';
import 'package:flutter_metatube_app/utils/styles/app_button_styles.dart';

class ReusableElevatedButton extends StatelessWidget {
  const ReusableElevatedButton({
    super.key,
    required this.onTap,
    required this.title,
  });

  final GestureTapCallback onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onTap,
      style: AppButtonStyles.elevatedButtonStyle,
      child: Text(title),
    );
  }
}
