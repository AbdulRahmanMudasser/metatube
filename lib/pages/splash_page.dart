import 'package:flutter/material.dart';
import 'package:flutter_metatube_app/utils/styles/app_colors.dart';
import 'package:flutter_metatube_app/utils/styles/app_text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.dark,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Application Icon
            const Icon(
              Icons.edit,
              color: AppColors.accent,
              size: 125,
            ),

            const SizedBox(height: 20),

            // Application Name
            Text(
              "M E T A T U B E",
              style: AppTextStyles.splashTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
