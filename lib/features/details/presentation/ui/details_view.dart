import 'package:flutter/material.dart';
import 'package:skin_dd/core/widgets/custom_app_bar.dart';
import 'package:skin_dd/features/details/presentation/widgets/details_view_body.dart';
import 'package:skin_dd/features/scanner/data/models/xception_response_model.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key, required this.xceptionResponseModel});
  final XceptionResponseModel xceptionResponseModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "Details", isVisible: true, context: context),
      body: SafeArea(child: DetailsViewBody(reposne: xceptionResponseModel)),
    );
  }
}
