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
      height: displayheight * 0.042,
      width: displayWidth * 0.25,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        alignment: Alignment.center,
        padding: EdgeInsets.only(right: 5),
        curve: Curves.fastLinearToSlowEaseIn,
        height: displayheight * 0.04,
        width: displayWidth * 0.23,

        decoration: BoxDecoration(
          color: isSelected ? Color(0xffEEEEEE) : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            AnimatedContainer(
              alignment: Alignment.center,
              curve: Curves.fastLinearToSlowEaseIn,
              duration: Duration(seconds: 1),
              height: displayheight * 0.04,
              width: displayWidth * 0.085,
              decoration: BoxDecoration(
                color: isSelected ? ColorsApp.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Center(
                child:
                    isSelected
                        ? Center(child: buttomnavigationbarEntity.image)
                        : Center(
                          child: SvgPicture.asset(
                            buttomnavigationbarEntity.unActiveImage,
                          ),
                        ),
              ),
            ),
            SizedBox(width: 2),
            AnimatedOpacity(
              opacity: isSelected ? 1 : 0,
              duration: Duration(seconds: 1),
              curve: Curves.fastLinearToSlowEaseIn,
              child: Text(
                isSelected ? buttomnavigationbarEntity.name : '',
                style: TextStyle(
                  color: ColorsApp.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
