import 'package:flutter/material.dart';
import 'package:skin_dd/core/constans/shared_pref_constans.dart';
import 'package:skin_dd/core/helper/routes/ongenerate_routes.dart';
import 'package:skin_dd/core/helper/routes/routes_name.dart';

class SkinDd extends StatelessWidget {
  SkinDd({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: onGenerateRoutes,
      initialRoute:
          isonboadingseen ? RoutesName.loginView : RoutesName.onBoardingView,
    );
  }
}
