import 'package:flutter/material.dart';

import '../theming/colors_app.dart';
import '../theming/text_style_app.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
        this.obscureText,
        this.suffixIcon,
        this.contentPadding,
        this.enabledBorder,
        this.focusedBorder,
        this.hintStyle,
        this.inputTextStyle,
        this.keyboardType,
        this.fillColor,
        this.filedColorBackground,
        this.errorBorder,
        this.focusedErrorBorder,
        required this.validator,
        required this.hintText,
        required this.controller});

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? errorBorder;
  final TextStyle? hintStyle;
  final TextStyle? inputTextStyle;
  final String hintText;
  final bool? obscureText;
  final Widget? suffixIcon;
  final Color? fillColor;
  final bool? filedColorBackground;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        return validator(value);
      },
      controller: controller,
      cursorColor: Colors.grey,
      obscureText: obscureText ?? false,
      style: TextStylesApp.font16Black600,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          filled: filedColorBackground ?? true,
          fillColor: fillColor ?? ColorsApp.lightGray,
          suffixIcon: suffixIcon,
          contentPadding: contentPadding ??
              const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          hintStyle: hintStyle ??
              TextStylesApp.font13Grey700
                  .copyWith(color: const Color(0xff949D9E)),
          hintText: hintText,
          isDense: true,
          errorBorder: errorBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.3,
                  )),
          focusedErrorBorder: focusedErrorBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1.3,
                  )),
          focusedBorder: focusedBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ColorsApp.lighterGray,
                    width: 1.3,
                  )),
          enabledBorder: enabledBorder ??
              OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: ColorsApp.lightGray,
                    width: 1.3,
                  ))),
    );
  }
}
