import 'package:flutter/material.dart';
import 'package:skin_dd/features/home/domain/entity/skin_desiease_entitty.dart';

class SkinDiseasesItem extends StatelessWidget {
  const SkinDiseasesItem({super.key, required this.skinDesieaseEntitty});
  final SkinDesieaseEntitty skinDesieaseEntitty;
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
            image: DecorationImage(
              image: AssetImage(skinDesieaseEntitty.image),
              fit: BoxFit.fill,
            ),
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
              skinDesieaseEntitty.title,
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
