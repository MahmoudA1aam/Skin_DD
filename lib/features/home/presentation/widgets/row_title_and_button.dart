import 'package:flutter/widgets.dart';
import 'package:skin_dd/core/theming/text_style_app.dart';

class RowTittleAndButtomText extends StatelessWidget {
  const RowTittleAndButtomText({
    super.key,
    required this.title,
    this.textbuttom,
  });
  final String title;
  final String? textbuttom;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStylesApp.font16Black600),
        Text(
          textbuttom ?? "See All",
          style: TextStylesApp.font14PrimaryColor400,
        ),
      ],
    );
  }
}
