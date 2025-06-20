import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constans/shared_pref_constans.dart';
import '../../../../core/helper/shared_pref_helper/shared_pref.dart';
import '../../../../core/theming/colors_app.dart';

class ImageProfileWidget extends StatelessWidget {
  const ImageProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var imagebase64 = base64Decode("");
    var imageinvalid = SharedPreferencesHelper.getDate(
      key: SharedPrefConstans.imageProfileinvalid,
    );
    if (imageinvalid == true) {
      String image =
          SharedPreferencesHelper.getDate(
            key: SharedPrefConstans.profileImage,
          ).toString();
      imagebase64 = base64Decode(image);
    }

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        imageinvalid == false
            ? CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 65,
              backgroundImage: AssetImage("assets/images/Image.png"),
            )
            : CircleAvatar(
              backgroundColor: Colors.grey[200],
              radius: 65,
              backgroundImage: MemoryImage(imagebase64),
            ),
      ],
    );
  }
}
