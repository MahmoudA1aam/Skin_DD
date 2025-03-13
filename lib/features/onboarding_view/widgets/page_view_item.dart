import 'package:flutter/material.dart';

import '../../../core/constans/shared_pref_constans.dart';
import '../../../core/helper/routes/routes_name.dart';
import '../../../core/helper/shared_pref_helper/shared_pref.dart';
import '../../../core/theming/text_style_app.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.background,
    required this.title,
    required this.isvisiable,
  });
  final String background, title;
  final bool isvisiable;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * 0.5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(background),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(60),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(25)),
              ),
              child: Visibility(
                visible: isvisiable,
                child: GestureDetector(
                  onTap: () {
                    SharedPreferencesHelper.saveDate(
                      key: SharedPrefConstans.keyOnboarding,
                      value: true,
                    );
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesName.loginView,
                    );
                  },
                  child: Text("Skip", style: TextStylesApp.font20Black600),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            title,
            style: TextStylesApp.font20Black600,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
