import 'package:intl/intl.dart';

String moneyFormated({required double value}) {
  final formatCurrency = NumberFormat.simpleCurrency(
    locale: 'en_US',
    decimalDigits: 2,
    name: '',
  );
  String formatted = formatCurrency.format(value);
  return formatted;
}
