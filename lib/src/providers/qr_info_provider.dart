import 'package:flutter/material.dart';

class QrInfoProvider with ChangeNotifier {
  String? qr;

  void setQr(String? qr) {
    this.qr = qr;
    notifyListeners();
  }

  String? getQr() {
    return qr;
  }
}
