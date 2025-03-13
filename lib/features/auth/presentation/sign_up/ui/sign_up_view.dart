import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Sign Up", context: context, isVisible: true),
      body: SignUpViewBody(),
    );
  }
}
