import 'package:flutter/material.dart';

import '../theming/colors_app.dart';
import '../theming/text_style_app.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onPressed, required this.title});
  final VoidCallback onPressed;
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: ColorsApp.primaryColor,
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStylesApp.font20white500,
          ),
        ),
      ),
    );
  }
}
