import 'package:flutter/material.dart';
import 'package:skin_dd/core/theming/text_style_app.dart';

import '../../../../../core/theming/colors_app.dart';

class PasswordValidation extends StatelessWidget {
  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasNumber,
    required this.hasMinLength,
  });

  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasNumber;
  final bool hasMinLength;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidationRow('At Least 1 lowerCase letter', hasLowerCase),
        SizedBox(height: 2),
        buildValidationRow('At Least 1 upperCase letter', hasUpperCase),
        SizedBox(height: 2),
        buildValidationRow(
          'At Least 1 special Characters letter',
          hasSpecialCharacters,
        ),
        SizedBox(height: 2),
        buildValidationRow('At Least 1 number letter', hasNumber),
        SizedBox(height: 2),
        buildValidationRow('At Least 8 characters letter', hasMinLength),
      ],
    );
  }

  Widget buildValidationRow(String text, bool hasValidated) {
    return Row(
      children: [
        CircleAvatar(
          radius: 2.5,
          backgroundColor: hasValidated ? ColorsApp.primaryColor : Colors.grey,
        ),
        SizedBox(width: 6),
        Text(
          text,
          style: TextStylesApp.font13Grey600.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: ColorsApp.primaryColor,
            decorationThickness: 2,
            color: hasValidated ? Colors.grey : ColorsApp.primaryColor,
          ),
        ),
      ],
    );
  }
}
