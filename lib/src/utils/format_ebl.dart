import 'package:intl/intl.dart';

String eblFormatted({String ebl = "0"}) {
  final formatCurrency = NumberFormat.simpleCurrency(
    locale: 'en_US',
    decimalDigits: 0,
    name: '',
  );
  String formatted = ebl.toString().split('.')[0];
  String roundedEBL = formatCurrency.format(int.parse(formatted));

  return roundedEBL;
}
