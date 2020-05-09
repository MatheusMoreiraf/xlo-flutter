import 'package:intl/intl.dart';

String getSanitizedText(String text) {
  return text.replaceAll(RegExp(r'[^\d]'), '');
}

bool isEmailValid(String email) {
  const Pattern pattern =
      r"^(([^<>()[\]\\.,;:\s@\']+(\.[^<>()[\]\\.,;:\s@\']+)*)|(\'.+\'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$";
  final RegExp regex = RegExp(pattern);
  return regex.hasMatch(email);
}

String numToString(num number) {
  return NumberFormat('###,##0.00', 'pt-br')
      .format(double.parse(number.toStringAsFixed(2)));
}

String dateToString(DateTime dateTime) {
  return DateFormat('dd/MM HH:mm', 'pt-br').format(dateTime);
}
