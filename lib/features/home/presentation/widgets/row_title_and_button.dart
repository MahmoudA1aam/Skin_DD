import 'package:flutter/widgets.dart';
import 'package:skin_dd/core/theming/text_style_app.dart';

class RowTittleAndButtomText extends StatelessWidget {
  const RowTittleAndButtomText({
    super.key,
    required this.title,
    required this.isSeeMore,
    this.onTap,
  });
  final String title;
  final bool isSeeMore;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStylesApp.font16Black600),

        Visibility(
          visible: isSeeMore,
          child: GestureDetector(
            onTap: onTap,
            child: Text("See more", style: TextStylesApp.font14PrimaryColor400),
          ),
        ),
      ],
    );
  }
}
