import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:skin_dd/features/onboarding_view/widgets/page_view_item.dart';

import '../../../core/constans/shared_pref_constans.dart';
import '../../../core/helper/routes/routes_name.dart';
import '../../../core/helper/shared_pref_helper/shared_pref.dart';
import '../../../core/theming/colors_app.dart';
import '../../../core/widgets/custom_button.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});

  @override
  State<OnboardingViewBody> createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  late PageController pageController;
  int currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      currentPage = pageController.page!.round();
      setState(() {});
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: PageView(
            controller: pageController,
            children: [
              PageViewItem(
                isvisiable: true,
                background: "assets/images/onboarding_1.png",
                title:
                    "Do you suffer from skin problems? We are here to help you diagnose and treat skin diseases!",
              ),
              PageViewItem(
                isvisiable: true,
                background: "assets/images/onboarding_2.png",
                title:
                    "Show symptoms or upload a picture of your skin to help you identify the disease.",
              ),
              PageViewItem(
                isvisiable: false,
                background: "assets/images/onboarding_3.png",
                title:
                    "Use scanning to help you detect and diagnose disease immediately.",
              ),
            ],
          ),
        ),

        DotsIndicator(
          dotsCount: 3,
          position: currentPage.toDouble(),
          decorator: const DotsDecorator(
            activeColor: ColorsApp.mainBlue,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 25),
        Visibility(
          visible: currentPage > 1 ? true : false,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: CustomButton(
              onPressed: () {
                SharedPreferencesHelper.saveDate(
                  key: SharedPrefConstans.keyOnboarding,
                  value: true,
                );
                Navigator.pushReplacementNamed(context, RoutesName.loginView);
              },
              title: 'Next',
            ),
          ),
        ),
        const SizedBox(height: 40),
      ],
    );
  }
}
