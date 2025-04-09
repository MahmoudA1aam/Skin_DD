import 'package:flutter/material.dart';

import '../theming/colors_app.dart';
import '../theming/text_style_app.dart';

AppBar customAppBar({
  required String title,
  required bool isVisible,
  required BuildContext context,
  Color? backgroundColor,
  titleColor,
  iconColor,
}) {
  return AppBar(
    title: Text(
      title,
      style: TextStylesApp.font19Black700.copyWith(
        color: titleColor ?? ColorsApp.primaryColor,
      ),
    ),
    centerTitle: true,
    backgroundColor: backgroundColor ?? Colors.transparent,
    leading: Visibility(
      visible: isVisible,
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back_ios, color: iconColor ?? Colors.black),
      ),
    ),
  );
}
