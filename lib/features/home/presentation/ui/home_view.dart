import 'package:flutter/material.dart';

import 'package:skin_dd/features/drawer/presentation/ui/custom_drawer.dart';

import 'package:skin_dd/features/home/presentation/widgets/home_view_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> animation;

  late AnimationController controller;
  late Animation<double> _scaleAnimation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
      reverseDuration: Duration(milliseconds: 200),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.8).animate(controller);
    animation = Tween<Offset>(
      begin: Offset(0, 0),
      end: Offset(0.5, 0.1),
    ).animate(controller);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomDrawer(),
        SlideTransition(
          position: animation,
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform:
                    Matrix4.identity()
                      ..rotateZ(0.2 * controller.value)
                      ..scale(_scaleAnimation.value), // زاوية دوران خفيفة
                child: HomeViewBody(
                  controllerValue: controller.value,
                  onTap: () {
                    controller.value == 0
                        ? controller.forward()
                        : controller.reverse();
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
