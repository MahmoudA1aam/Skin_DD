import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // تم التغيير ليكون أكثر دقة

import '../../../../../core/theming/colors_app.dart';

class ImageProfileSignUp extends StatelessWidget {
  const ImageProfileSignUp({super.key, required this.image});
  final XFile? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey[200],
          radius: 65,
          backgroundImage:
              image != null && image!.path.isNotEmpty
                  ? FileImage(File(image!.path))
                  : const AssetImage('assets/images/Image.png')
                      as ImageProvider,
        ),

        CircleAvatar(
          backgroundColor: ColorsApp.primaryColor,
          radius: 18,
          child: const Icon(
            Icons.camera_alt_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
      ],
    );
  }
}
