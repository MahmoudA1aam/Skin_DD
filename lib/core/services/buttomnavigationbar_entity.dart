import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

class ButtomnavigationbarEntity {
  final String unActiveImage;
  final String name;
  final Widget image;

  ButtomnavigationbarEntity({
    required this.image,

    required this.unActiveImage,
    required this.name,
  });
}

List<ButtomnavigationbarEntity> getbuttomnavigationbarList = [
  ButtomnavigationbarEntity(
    unActiveImage: "assets/icons/outline/home.svg",
    name: "Home",
    image: SvgPicture.asset("assets/icons/bold/home.svg"),
  ),
  ButtomnavigationbarEntity(
    unActiveImage: "assets/icons/outline/scan.svg",
    name: "Scan",
    image: SvgPicture.asset(
      "assets/icons/outline/scan.svg",
      color: Colors.white,
    ),
  ),
  ButtomnavigationbarEntity(
    unActiveImage: "assets/icons/outline/user.svg",
    name: "Profile",
    image: SvgPicture.asset("assets/icons/bold/user.svg"),
  ),
];
