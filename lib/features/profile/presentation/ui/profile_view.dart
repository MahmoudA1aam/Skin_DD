import 'package:flutter/material.dart';
import 'package:skin_dd/core/theming/colors_app.dart';
import 'package:skin_dd/features/profile/presentation/widgets/profile_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        isVisibleAction: false,
        title: "Profile",
        context: context,
        isVisible: true,
        backgroundColor: Color(0xFF1ABDCA),
        titleColor: Colors.white,
        iconColor: Colors.white,
      ),
      body: SafeArea(child: ProfileViewBody()),
    );
  }
}
