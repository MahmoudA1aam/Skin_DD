import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:skin_dd/core/helper/routes/routes_name.dart';
import 'package:skin_dd/features/history/presentation/ui/history_view.dart';
import 'package:skin_dd/features/home/presentation/ui/home_view.dart';
import 'package:skin_dd/features/profile/presentation/ui/profile_view.dart';
import 'package:skin_dd/features/scanner/presentation/ui/scanner_view.dart';
import 'package:skin_dd/features/skin_diseases/presentation/ui/Skin_diseases_view.dart';

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

    case RoutesName.profileView:
      return MaterialPageRoute(builder: (context) => ProfileView());
    case RoutesName.categoryView:
      return MaterialPageRoute(builder: (context) => SkinDiseasesView());
    case RoutesName.historyView:
      return MaterialPageRoute(builder: (context) => HistoryView());

    default:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
  }
}
