import 'package:flutter/material.dart';
import 'package:skin_dd/core/helper/shared_pref_helper/shared_pref.dart';

import 'package:skin_dd/core/theming/text_style_app.dart';

import '../../../../core/constans/shared_pref_constans.dart';
import '../../../../core/helper/get_upper_word.dart';

@override
AppBar HomeAppBarWidget({
  required VoidCallback onpreseed,
  required double controllerValue,
}) {
  return AppBar(
    actions: [],
    elevation: 0,
    backgroundColor: Colors.transparent,
    leading: IconButton(
      onPressed: onpreseed,
      icon:
          controllerValue == 0
              ? const Icon(Icons.menu)
              : const Icon(Icons.arrow_back_ios),
    ),
    centerTitle: true,
    title: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Hi, ${capitalizeFirstOfEachWord(SharedPreferencesHelper.getDate(key: SharedPrefConstans.firstName).toString())}",
          style: TextStylesApp.font16Black600,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 5),
        Text("How Are you Today?", style: TextStylesApp.font11primarycolore600),
      ],
    ),
  );
}
