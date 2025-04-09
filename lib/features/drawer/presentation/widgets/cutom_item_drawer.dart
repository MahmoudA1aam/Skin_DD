import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skin_dd/core/theming/text_style_app.dart';
import 'package:skin_dd/features/drawer/domain/entity/drawer_entity.dart';

class CutomItemDrawer extends StatelessWidget {
  const CutomItemDrawer({super.key, required this.drawerEntity});

  final DrawerEntity drawerEntity;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          SizedBox(
            height: 25,
            width: 25,
            child: SvgPicture.asset(
              drawerEntity.image,
              fit: BoxFit.cover,
              color: Colors.white,
            ),
          ),
          SizedBox(width: 15),

          Text(
            drawerEntity.title,
            style: TextStylesApp.font19Black700.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
