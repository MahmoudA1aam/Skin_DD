import 'package:flutter/material.dart';

import 'package:skin_dd/features/home/presentation/widgets/In_active_item_bottom_nav_bar.dart';
import 'package:skin_dd/features/home/presentation/widgets/active_item_bottom_nav_bar.dart';

import '../../../../core/services/buttomnavigationbar_entity.dart';
import 'naviagtion_bar_Item.dart';

class CustomBotttomNavigatoionBar extends StatelessWidget {
  const CustomBotttomNavigatoionBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0x1900000),
            blurRadius: 25,
            offset: Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:
            getbuttomnavigationbarList.map((e) {
              return NaviagtionBarItem(
                isSelected: true,
                buttomnavigationbarEntity: e,
              );
            }).toList(),
      ),
    );
  }
}
