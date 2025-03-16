import 'package:flutter/material.dart';
import 'package:skin_dd/core/theming/colors_app.dart';

import '../../../../core/theming/text_style_app.dart';

class SkinDiseasesView extends StatelessWidget {
  const SkinDiseasesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Skin Diseases", style: TextStylesApp.font20Black600),
          SizedBox(height: 10),

          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: 5,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,

                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                return SkinDiseasesItem();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SkinDiseasesItem extends StatelessWidget {
  const SkinDiseasesItem({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.sizeOf(context);
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          height: mediaQuery.height * 0.17,
          width: mediaQuery.width * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,

            borderRadius: BorderRadius.circular(12),
          ),
        ),
        Container(
          height: mediaQuery.height * 0.13,
          width: mediaQuery.width * 0.4,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorsApp.primaryColor,
            boxShadow: const [
              /*  BoxShadow(
                color: Colors.black26,
                spreadRadius: -2,
                blurStyle: BlurStyle.outer,
                blurRadius: 6,
                offset: Offset(10.0, 11.0),
              ),*/
            ],
          ),
        ),
        Positioned(
          bottom: -25,
          top: 50,
          child: Center(
            child: Text(
              "Exaema",
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
