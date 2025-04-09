import 'package:flutter/material.dart';

import 'package:skin_dd/core/theming/text_style_app.dart';

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hi, Mahmoud!", style: TextStylesApp.font16Black600),
        const SizedBox(height: 5),
        Text("How Are you Today?", style: TextStylesApp.font11primarycolore600),
      ],
    ),
  );
}
