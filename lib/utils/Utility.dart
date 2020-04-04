import 'package:intl/intl.dart';

class Utils {
  static final appId = "d67bd1beffdf5b67b38454f5837a0906";

  static String getFormattedDate(DateTime dateTime) {
    return new DateFormat('EEE, MMM d, y').format(dateTime);
  }
}
