import 'package:intl/intl.dart';

extension TimeExtention on DateTime {
  String get timeFormater {
    return DateFormat("h: mm a").format(this);
    // return "${this.hour}: ${this.minute}";
  }
}
