import 'package:flutter/material.dart';
import 'package:skin_dd/core/widgets/custom_app_bar.dart';
import 'package:skin_dd/features/history/presentation/widgets/history_view_body.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        title: "History",
        isVisible: true,
        isVisibleAction: false,
        context: context,
      ),
      body: HistoryViewBody(),
    );
  }
}
