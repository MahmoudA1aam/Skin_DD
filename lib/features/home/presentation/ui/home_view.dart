import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:skin_dd/core/theming/colors_app.dart';
import 'package:skin_dd/features/skin_diseases/presentation/ui/Skin_diseases_view.dart';

import 'package:skin_dd/features/home/presentation/widgets/home_view_body.dart';
import 'package:skin_dd/features/profile/presentation/ui/profile_view.dart';
import 'package:skin_dd/features/scanner/presentation/scanner_view.dart';

import '../../../../core/helper/routes/routes_name.dart';
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
      floatingActionButton: Container(
        margin: const EdgeInsets.only(top: 10, bottom: 30),
        height: 75,
        width: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(27),
        ),

        child: Center(
          child: Container(
            decoration: BoxDecoration(
              color: ColorsApp.primaryColor,
              borderRadius: BorderRadius.circular(27),
            ),
            height: 70,
            width: 70,
            child: Center(
              child: FloatingActionButton(
                elevation: 0,
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.scannerView);
                },
                backgroundColor: ColorsApp.primaryColor,
                child: SvgPicture.asset(
                  "assets/icons/outline/scan.svg",
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(child: screen[selectedIndex]),
      bottomNavigationBar: CustomBotttomNavigatoionBar(
        onChanged: (value) {
          selectedIndex = value;
          setState(() {});
        },
      ),
    );
  }
}
