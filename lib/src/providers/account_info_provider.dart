import 'package:flutter/material.dart';

class AccountInfoProvider with ChangeNotifier {
  String? _nombreTitular;
  String? _nombreBanco;
  int? _numeroCuenta;
//GETTERS
  String? get nombreTitular => _nombreTitular;
  String? get nombreBanco => _nombreBanco;
  int? get numeroCuenta => _numeroCuenta;

//SETTERS

  set nombreTitular(String? titular) {
    _nombreTitular = titular;
    notifyListeners();
  }

  set nombreBanco(String? banco) {
    _nombreBanco = banco;
    notifyListeners();
  }

  set numeroCuenta(int? cuenta) {
    _numeroCuenta = cuenta;
    notifyListeners();
  }
}
