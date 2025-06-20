import 'package:flutter/material.dart';
import 'package:skin_dd/core/widgets/custom_app_bar.dart';
import 'package:skin_dd/features/skin_diseases/presentation/widgets/skin_view_body.dart';

class SkinDiseasesView extends StatelessWidget {
  const SkinDiseasesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "Skin Diseases",
        isVisible: true,
        isVisibleAction: false,
        context: context,
      ),
      body: SkinViewBody(),
    );
  }
}
