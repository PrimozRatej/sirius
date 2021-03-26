import 'package:intl/intl.dart';

class Formater{
  static String getDateFromUnix(int timestamp){
    DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedDate = DateFormat.yMMMd().format(date);
    return formattedDate;
  }
}