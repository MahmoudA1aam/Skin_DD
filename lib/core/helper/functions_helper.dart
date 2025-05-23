import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import '../theming/colors_app.dart';

String filterDate(String dateTimeString) {
  if (dateTimeString == null || dateTimeString.isEmpty) {
    return "تاريخ غير صالح";
  }

  // استبدال المسافة بـ T
  String correctedDateTimeString = dateTimeString.replaceFirst(" ", "T");

  try {
    // تحويل السلسلة إلى DateTime
    DateTime dateTime = DateTime.parse(correctedDateTimeString);

    // تنسيق التاريخ فقط (مثال: 2025-05-10)
    return DateFormat('yyyy-MM-dd').format(dateTime);
  } catch (e) {
    return "تاريخ غير صالح";
  }
}

class SnackBarService {
  static void showSuccessMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 150 : 95,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(left: 24, right: 24),
            decoration: BoxDecoration(
              color: ColorsApp.primaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                msg.length > 80
                    ? Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            msg,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: cancelFunc,
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                    : Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            msg,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.fade,
                            maxLines: 3,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: cancelFunc,
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
          ),
        );
      },
      duration: const Duration(seconds: 10),
      dismissDirections: [DismissDirection.endToStart],
    );
  }

  static void showErrorMessage(String msg) {
    BotToast.showCustomNotification(
      toastBuilder: (void Function() cancelFunc) {
        return Material(
          color: Colors.transparent,
          child: Container(
            width: double.maxFinite,
            height: msg.length > 80 ? 150 : 95,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(left: 24, right: 24),
            decoration: BoxDecoration(
              color: Colors.red[600],
              borderRadius: BorderRadius.circular(12),
            ),
            child:
                msg.length > 80
                    ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            msg,
                            textAlign: TextAlign.center,
                            // maxLines: 3,
                            // overflow: TextOverflow.fade,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: cancelFunc,
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            msg,
                            textAlign: TextAlign.start,
                            maxLines: 3,
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: cancelFunc,
                            icon: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
          ),
        );
      },
      duration: const Duration(seconds: 10),
      dismissDirections: [DismissDirection.endToStart],
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.circle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.black
    ..backgroundColor = Colors.white
    ..textColor = Colors.white
    ..indicatorColor = ColorsApp.mainBlue
    ..userInteractions = false
    ..dismissOnTap = false;
}
