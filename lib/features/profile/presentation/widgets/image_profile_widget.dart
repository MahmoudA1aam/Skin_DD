import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/colors_app.dart';

class ImageProfileWidget extends StatelessWidget {
  const ImageProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 65,
          child: CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage("assets/images/Image.png"),
          ),
        ),

        CircleAvatar(
          backgroundColor: Colors.white,
          radius: 18,
          child: CircleAvatar(
            backgroundColor: Color(0xffF8F8F8),
            radius: 15,
            child: SvgPicture.asset(
              "assets/icons/edite_icon.svg",
              color: ColorsApp.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
