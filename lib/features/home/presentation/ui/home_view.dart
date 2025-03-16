import 'package:flutter/material.dart';
import 'package:skin_dd/features/categories/presentation/ui/Skin_diseases_view.dart';

import 'package:skin_dd/features/home/presentation/widgets/home_view_body.dart';
import 'package:skin_dd/features/profile/presentation/ui/profile_view.dart';
import 'package:skin_dd/features/scanner/presentation/scanner_view.dart';

import '../widgets/custom_bottom_navigatoion_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> screen = [
    HomeViewBody(),
    ScannerView(),

    SkinDiseasesView(),
    ProfileView(),
  ];

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: screen[selectedIndex]),
      bottomNavigationBar: Stack(
        children: [
          CustomBotttomNavigatoionBar(
            onChanged: (value) {
              selectedIndex = value;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
