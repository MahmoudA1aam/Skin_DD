import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:skin_dd/core/theming/text_style_app.dart';

import 'image_profile_widget.dart';

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xFF1ABDCA),
      child: Column(
        children: [
          Text(
            "Profile",
            style: TextStylesApp.font20Black600.copyWith(color: Colors.white),
          ),
          Expanded(child: SizedBox()),

          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: mediaQuery.height * 0.75,

                color: Color(0xFF1ABDCA),
              ),
              Container(
                height: mediaQuery.height * 0.65,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 60),
                      Text(
                        "Edit Photo",
                        style: TextStylesApp.font14PrimaryColor400,
                      ),
                      SizedBox(height: 20),
                      ProfileItem(
                        title: "Mahmoud Alaam",
                        image: "assets/icons/outline/user.svg",
                      ),
                      SizedBox(height: 20),
                      ProfileItem(
                        title: "Mahmoud15867@gmail.com",
                        image: "assets/icons/email_icon.svg",
                      ),
                      SizedBox(height: 20),
                      ProfileItem(
                        title: "01/3/2005",
                        image: "assets/icons/calendar.svg",
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(top: 6, child: ImageProfileWidget()),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({super.key, required this.title, required this.image});
  final String title, image;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 201, 214, 214),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(title: Text(title), leading: SvgPicture.asset(image)),
    );
  }
}
