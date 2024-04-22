import 'package:intl/intl.dart';

class DateFormatUtils {
  /// Method to format date
  static String formatDate() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy-MM-dd');
    final formattedDate = formatter.format(now);

    return formattedDate;
  }
}