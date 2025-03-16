import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/theming/text_style_app.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    super.key,
    required this.title,
    required this.image,
    required this.imageColor,
    required this.containerColor,
  });
  final String title, image;
  final Color imageColor, containerColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(title, style: TextStylesApp.font13Grey700),
          leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: containerColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(child: SvgPicture.asset(image, color: imageColor)),
          ),
        ),

        Divider(color: Color(0xFFEDEDED), indent: 15),
      ],
    );
  }
}
