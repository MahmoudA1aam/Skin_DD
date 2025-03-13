import 'package:flutter/material.dart';
import 'package:skin_dd/core/theming/colors_app.dart';

import 'font_wieght_helper.dart';

class TextStylesApp {
  static TextStyle font20Black600 = const TextStyle(
    fontSize: 20,
    color: Colors.black,
    fontWeight: FontWeightHelper.medium500,
  );
  static TextStyle font20white500 = const TextStyle(
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeightHelper.medium500,
  );
  static TextStyle font19Black700 = const TextStyle(
    fontSize: 19,
    color: Colors.black,
    fontWeight: FontWeightHelper.bold700,
  );
  static TextStyle font16Black600 = const TextStyle(
    fontSize: 16,
    color: Colors.black,
    fontWeight: FontWeightHelper.semiBold600,
  );

  static TextStyle font16grey600 = const TextStyle(
    fontSize: 16,
    color: Colors.grey,
    fontWeight: FontWeightHelper.semiBold600,
  );
  static TextStyle font13Grey700 = const TextStyle(
    fontSize: 13,
    color: Colors.grey,
    fontWeight: FontWeightHelper.bold700,
  );
  static TextStyle font14PrimaryColor400 = const TextStyle(
    fontSize: 14,
    color: ColorsApp.primaryColor,
    fontWeight: FontWeightHelper.regular400,
  );

  static TextStyle font13Grey600 = const TextStyle(
    fontSize: 13,
    color: Colors.grey,
    fontWeight: FontWeightHelper.semiBold600,
  );
  static TextStyle font11primarycolore600 = const TextStyle(
    fontSize: 11,
    color: ColorsApp.primaryColor,
    fontWeight: FontWeightHelper.semiBold600,
  );
}
