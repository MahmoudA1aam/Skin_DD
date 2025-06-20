import 'package:flutter/widgets.dart';
import 'package:skin_dd/core/theming/text_style_app.dart';

class RowTittleAndButtomText extends StatelessWidget {
  const RowTittleAndButtomText({super.key, required this.title,required this.route,});
  final String title;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStylesApp.font16Black600),
        GestureDetector(
            child: Text('Show More', style: TextStylesApp.font16blue600),
          onTap: () {
            Navigator.pushNamed(
              context,
              route,
            );
          },
        ),
      ],
    );
  }
}
