import 'package:flutter/material.dart';
import 'package:skin_dd/features/home/presentation/widgets/In_active_item_bottom_nav_bar.dart';
import 'package:skin_dd/features/home/presentation/widgets/active_item_bottom_nav_bar.dart';

import '../../../../core/services/buttomnavigationbar_entity.dart';

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
    return isSelected
        ? ActiveItem(image: buttomnavigationbarEntity.activeImage)
        : InActiveitem(image: buttomnavigationbarEntity.unActiveImage);
  }
}
