import 'package:flutter/material.dart';
import 'package:skin_dd/features/skin_diseases/widgets/skin_view_body.dart';

class SkinDiseasesView extends StatelessWidget {
  const SkinDiseasesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(), body: SkinViewBody());
  }
}
