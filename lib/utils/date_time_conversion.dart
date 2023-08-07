import 'package:intl/intl.dart';

DateTime? convertStringToDateTime(String dateString) {
  dateString = dateString.replaceAll(" ", "");
  dateString = dateString.replaceAll("am", "AM").replaceAll("pm", "PM");
  DateFormat inputFormat = DateFormat('M/d/y,h:mm:ssa');
  DateTime dateTime = inputFormat.parse(dateString);
  return dateTime;
}