import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:skin_dd/core/helper/routes/routes_name.dart';
import 'package:skin_dd/core/helper/shared_pref_helper/shared_pref.dart';
import 'package:skin_dd/core/theming/text_style_app.dart';
import 'package:skin_dd/features/drawer/domain/entity/drawer_entity.dart';
import 'package:skin_dd/features/drawer/presentation/widgets/cutom_item_drawer.dart';

import '../../../../core/constans/shared_pref_constans.dart';
import '../../../../core/helper/get_upper_word.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

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
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0B6676), Color(0xFF0D7C8F), Color(0xFF0E92A8)],
          stops: [0.1, 0.6, 1.0],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Column(
              children: [
                SizedBox(height: 50),
                Row(
                  children: [
                    imageinvalid == false
                        ? Icon(Icons.account_circle,size: 50,color: Colors.grey,)
                        : CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 23,
                            backgroundImage: MemoryImage(imagebase64),
                          ),
                        ),
                    SizedBox(width: 10),
                    Text(
                      "${capitalizeFirstOfEachWord(SharedPreferencesHelper.getDate(key: SharedPrefConstans.firstName).toString())} ${capitalizeFirstOfEachWord(SharedPreferencesHelper.getDate(key: SharedPrefConstans.lastName).toString())}",
                      style: TextStylesApp.font20white500,
                    ),
                  ],
                ),
                SizedBox(height: 150),

                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: DrawerEntity.drawerItemList.length,
                    itemBuilder: (context, index) {
                      var data = DrawerEntity.drawerItemList[index];

                      return GestureDetector(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Navigator.pushNamed(
                                context,
                                RoutesName.profileView,
                              );

                            case 1:
                              Navigator.pushNamed(
                                context,
                                RoutesName.categoryView,
                              );
                            case 2:
                              Navigator.pushNamed(
                                context,
                                RoutesName.historyView,
                              );
                            default:
                              Navigator.pushNamed(context, RoutesName.homeView);
                          }
                        },
                        child: CutomItemDrawer(drawerEntity: data),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/*
class CustomDrawerItem extends StatefulWidget {
  const CustomDrawerItem({super.key});

  @override
  State<CustomDrawerItem> createState() => _CustomDrawerItemState();
}

class _CustomDrawerItemState extends State<CustomDrawerItem>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<Color?> colorAnimation;
  bool click = false;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    colorAnimation = ColorTween(
      begin: ColorsApp.primaryColor,
    ).animate(controller);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            controller.value == 0 ? controller.forward() : controller.forward();
          },
          child: AnimatedBuilder(
            animation: colorAnimation,
            builder: (context, child) {
              return Container(
                height: 80,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    stops: [controller.value, controller.value],

                    colors: [Colors.transparent, Colors.white],
                  ),

                  borderRadius: BorderRadius.circular(25),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}*/
