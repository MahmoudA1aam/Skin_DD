import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Login", isVisible: false, context: context),
      body: LoginViewBody(),
    );
  }
}
