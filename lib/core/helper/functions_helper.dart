import 'package:intl/intl.dart';

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
