import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skin_dd/core/helper/shared_pref_helper/shared_pref.dart';

import 'package:skin_dd/core/theming/text_style_app.dart';
import 'package:skin_dd/features/profile/presentation/widgets/profile_item.dart';

import '../../../../core/constans/shared_pref_constans.dart';
import '../../../../core/helper/routes/routes_name.dart';
import '../../../../core/theming/colors_app.dart';
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
                      containerColor: Color(0xffEAF2FF),
                      imageColor: ColorsApp.mainBlue,
                      title:
                          "${SharedPreferencesHelper.getDate(key: SharedPrefConstans.userNmae)}",
                      image: "assets/icons/outline/user.svg",
                    ),
                    SizedBox(height: 20),
                    ProfileItem(
                      imageColor: Color(0xFF22C55E),
                      containerColor: Color(0xFFE9FAEF),
                      title:
                          "${SharedPreferencesHelper.getDate(key: SharedPrefConstans.userEmail)}",
                      image: "assets/icons/email_icon.svg",
                    ),
                    SizedBox(height: 20),
                    ProfileItem(
                      imageColor: Color(0xffFF4C5E),
                      containerColor: Color(0xFFFFEEEF),
                      title:
                          "${SharedPreferencesHelper.getDate(key: SharedPrefConstans.userBirthdate)}",
                      image: "assets/icons/calendar.svg",
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () {
                        SharedPreferencesHelper.removeData(
                          key: SharedPrefConstans.userToken,
                        );
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          RoutesName.loginView,
                          (route) => false,
                        );
                      },
                      child: Container(
                        height: 41,
                        color: Color(0xFFB8E2E7),
                        child: Row(
                          children: [
                            SizedBox(width: 20),
                            SvgPicture.asset(
                              "assets/icons/logout_icon.svg",
                              color: ColorsApp.primaryColor,
                            ),

                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Logout",
                                    textAlign: TextAlign.center,
                                    style: TextStylesApp.font16grey600.copyWith(
                                      color: ColorsApp.primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
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
