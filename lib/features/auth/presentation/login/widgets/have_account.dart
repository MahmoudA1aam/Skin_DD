import 'package:flutter/material.dart';

import '../../../../../../core/theming/text_style_app.dart';

class CreatAndNotHaveAccount extends StatelessWidget {
  const CreatAndNotHaveAccount({
    super.key,
    required this.textHave,
    required this.creatAccount,
  });
  final String textHave, creatAccount;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          textHave,
          style: TextStylesApp.font14PrimaryColor400.copyWith(
            color: Colors.grey,
          ),
        ),
        Text(creatAccount, style: TextStylesApp.font14PrimaryColor400),
      ],
    );
  }
}
