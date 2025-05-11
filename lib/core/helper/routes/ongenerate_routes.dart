import 'package:flutter/material.dart';
import 'package:skin_dd/core/helper/routes/routes_name.dart';
import 'package:skin_dd/features/history/presentation/ui/history_view.dart';

import 'package:skin_dd/features/profile/presentation/ui/profile_view.dart';

import 'package:skin_dd/features/skin_diseases/presentation/ui/Skin_diseases_view.dart';
import 'package:skin_dd/main_view.dart';

import '../../../features/auth/presentation/login/ui/login_view_.dart';
import '../../../features/auth/presentation/sign_up/ui/sign_up_view.dart';
import '../../../features/details/presentation/ui/details_view.dart';
import '../../../features/onboarding_view/ui/onboarding_view.dart';

import '../../data/models/get_diagnosis_model.dart';

Route<dynamic>? onGenerateRoutes(RouteSettings settings) {
  final arguments = settings.arguments;
  switch (settings.name) {
    case RoutesName.onBoardingView:
      return MaterialPageRoute(builder: (context) => OnboardingView());
    case RoutesName.loginView:
      return MaterialPageRoute(builder: (context) => LoginView());
    case RoutesName.signUpView:
      return MaterialPageRoute(builder: (context) => SignUpView());

    case RoutesName.homeView:
      return MaterialPageRoute(builder: (context) => MainView());

    case RoutesName.profileView:
      return MaterialPageRoute(builder: (context) => ProfileView());
    case RoutesName.categoryView:
      return MaterialPageRoute(builder: (context) => SkinDiseasesView());
    case RoutesName.historyView:
      return MaterialPageRoute(builder: (context) => HistoryView());
    case RoutesName.detailsView:
      return MaterialPageRoute(
        builder:
            (context) => DetailsView(
              getItemDiagnosisModel: arguments as GetItemDiagnosisModel,
            ),
      );

    default:
      return MaterialPageRoute(builder: (context) => const OnboardingView());
  }
}
