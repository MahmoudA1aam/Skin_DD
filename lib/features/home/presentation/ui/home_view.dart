import 'package:flutter/material.dart';
import 'package:skin_dd/features/home/presentation/widgets/home_view_body.dart';

import '../widgets/custom_bottom_navigatoion_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeViewBody(),
      bottomNavigationBar: CustomBotttomNavigatoionBar(),
    );
  }
}
