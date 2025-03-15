import 'package:flutter/material.dart';
import 'package:skin_dd/features/home/presentation/widgets/home_app_bar_widget.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [HomeAppbarWiget()]),
    );
  }
}
