import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skin_dd/core/theming/text_style_app.dart';

import '../../../../core/theming/colors_app.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Color(0xffEEEEEE),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: ColorsApp.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(child: SvgPicture.asset(image)),
            ),
            SizedBox(width: 4),
            Text("Home", style: TextStylesApp.font11primarycolore600),
          ],
        ),
      ),
    );
  }
}
