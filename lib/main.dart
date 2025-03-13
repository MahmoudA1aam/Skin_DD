import 'package:flutter/material.dart';
import 'package:skin_dd/core/constans/shared_pref_constans.dart';
import 'package:skin_dd/skin_dd.dart';

import 'core/helper/shared_pref_helper/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await onBoardingseen();
  runApp(SkinDd());
}

Future<void> onBoardingseen() async {
  await SharedPreferencesHelper.init();
  var key = SharedPreferencesHelper.getDate(
    key: SharedPrefConstans.keyOnboarding,
  );
  if (key == true) {
    isonboadingseen = true;

    //Navigator.pushReplacementNamed(context, RoutesName.loginView);
  } else {
    isonboadingseen = false;

    //Navigator.of(context).pushReplacementNamed(RoutesName.onBoardingView);
  }
}
