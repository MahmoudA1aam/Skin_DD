import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/services/buttomnavigationbar_entity.dart';
import '../../../../core/theming/colors_app.dart';

class NaviagtionBarItem extends StatelessWidget {
  const NaviagtionBarItem({
    super.key,
    required this.isSelected,
    required this.buttomnavigationbarEntity,
  });
  final bool isSelected;
  final ButtomnavigationbarEntity buttomnavigationbarEntity;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    double displayheight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: displayheight * 0.035,
      width: displayWidth * 0.075,
      child: AnimatedContainer(
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(seconds: 1),
        height: displayheight * 0.035,
        width: displayWidth * 0.075,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: isSelected ? ColorsApp.primaryColor : Colors.transparent,
        ),

        child:
            isSelected
                ? Center(child: buttomnavigationbarEntity.image)
                : Center(
                  child: SvgPicture.asset(
                    buttomnavigationbarEntity.unActiveImage,
                  ),
                ),
      ),
    );
  }
}
