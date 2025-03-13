import 'package:flutter/material.dart';

import '../../../../../core/theming/colors_app.dart';

class CustomCheckBox extends StatefulWidget {
  const CustomCheckBox({super.key, required this.index, required this.onTap});

  final int index;

  final void Function() onTap;

  @override
  State<CustomCheckBox> createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = widget.index;
        });
      },
      child: AnimatedContainer(
        padding: EdgeInsets.zero,
        decoration: BoxDecoration(
          color:
              selected == widget.index
                  ? ColorsApp.primaryColor
                  : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color:
                selected == widget.index ? ColorsApp.primaryColor : Colors.grey,
            width: 1.5,
          ),
        ),
        height: 24,
        width: 24,
        duration: const Duration(milliseconds: 200),
      ),
    );
  }
}
