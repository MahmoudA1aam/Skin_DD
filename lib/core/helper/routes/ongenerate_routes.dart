import 'package:flutter/material.dart';
import 'package:skin_dd/core/helper/routes/routes_name.dart';
import 'package:skin_dd/features/home/presentation/ui/home_view.dart';

import '../../../features/auth/presentation/login/ui/login_view_.dart';
import '../../../features/auth/presentation/sign_up/ui/sign_up_view.dart';
import '../../../features/onboarding_view/ui/onboarding_view.dart';

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case RoutesName.onBoardingView:
      return MaterialPageRoute(builder: (context) => OnboardingView());
    case RoutesName.loginView:
      return MaterialPageRoute(builder: (context) => LoginView());
    case RoutesName.signUpView:
      return MaterialPageRoute(builder: (context) => SignUpView());

    case RoutesName.homeView:
      return MaterialPageRoute(builder: (context) => HomeView());

    default:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
  }
}
