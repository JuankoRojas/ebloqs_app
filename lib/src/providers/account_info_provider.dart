import 'package:flutter/material.dart';

class AccountInfoProvider with ChangeNotifier {
  String? _nombreTitular;
  String? _nombreBanco;
  int? _numeroCuenta;
  bool? _isCheckedBankInfo;
  bool? _isCheckedtransactInfo;
//GETTERS
  String? get nombreTitular => _nombreTitular;
  String? get nombreBanco => _nombreBanco;
  int? get numeroCuenta => _numeroCuenta;
  bool? get checkedBankInfo => _isCheckedBankInfo;
  bool? get checkedtransactInfo => _isCheckedtransactInfo;

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

  set checkedBankInfo(bool? checkedBankInfo) {
    _isCheckedBankInfo = checkedBankInfo;
    notifyListeners();
  }

  set checkedtransactInfo(bool? checkedtransactInfo) {
    _isCheckedtransactInfo = checkedtransactInfo;
    notifyListeners();
  }
}
