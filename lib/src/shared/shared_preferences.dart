import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static String? _token;
  static String? _id_wallet;
  static String? _mnemonic;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

//GETTERS

  static String? get token {
    return _prefs.getString('token') ?? _token;
  }

  static String? get id_wallet {
    return _prefs.getString('id_wallet') ?? _id_wallet;
  }

  static String? get mnemonic {
    return _prefs.getString('mnemonic') ?? _mnemonic;
  }

//SETTERS
  static set token(String? token) {
    _token = token;
    _prefs.setString('token', token!);
  }

  static set id_wallet(String? idWallet) {
    _id_wallet = idWallet;
    _prefs.setString('id_wallet', idWallet!);
  }

  static set mnemonic(String? mnemonic) {
    _mnemonic = mnemonic;
    _prefs.setString('mnemonic', mnemonic!);
  }
}
