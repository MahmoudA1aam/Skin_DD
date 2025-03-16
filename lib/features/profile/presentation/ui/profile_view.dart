import 'package:flutter/material.dart';
import 'package:skin_dd/features/profile/presentation/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ProfileViewBody());
  }
}
