import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skin_dd/core/theming/text_style_app.dart';

class HomeAppbarWiget extends StatelessWidget {
  const HomeAppbarWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(backgroundColor: Colors.red, radius: 25),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hi, Mahmoud!", style: TextStylesApp.font16Black600),
                const SizedBox(height: 5),
                Text(
                  "How Are you Today?",
                  style: TextStylesApp.font11primarycolore600,
                ),
              ],
            ),
          ],
        ),
        CircleAvatar(
          backgroundColor: Color(0xffF5F5F5),
          radius: 24,
          child: SvgPicture.asset("assets/icons/rang_notification.svg"),
        ),
      ],
    );
  }
}
