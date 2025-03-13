import 'package:flutter/material.dart';

import '../../../../../core/theming/text_style_app.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(color: Color(0xFFDCDEDE))),
        const SizedBox(width: 18),
        Text(
          'Or sign in with',
          textAlign: TextAlign.center,
          style: TextStylesApp.font16Black600.copyWith(color: Colors.grey),
        ),
        const SizedBox(width: 18),
        const Expanded(child: Divider(color: Color(0xFFDCDEDE))),
      ],
    );
  }
}
