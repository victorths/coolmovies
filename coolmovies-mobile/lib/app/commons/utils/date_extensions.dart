import 'package:intl/intl.dart';

extension CustomDateTime on DateTime {
  String get formatDate {
    try {
      return DateFormat.Md('en-US').format(this);
    } catch (e) {
      return '';
    }
  }
}
