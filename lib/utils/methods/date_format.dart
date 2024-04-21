import 'package:intl/intl.dart';

class DateFormatUtils {
  static String formatDate() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final formattedDate = formatter.format(now);

    return formattedDate;
  }
}