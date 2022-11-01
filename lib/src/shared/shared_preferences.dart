import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static late SharedPreferences _prefs;
  static String? _token;
  static String? _uid;
  static String? _id_wallet;
  static String? _public_key;
  static String? _mnemonic;
  static String? _userName;
  static String? _local_auth;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

//GETTERS

  static String? get token {
    return _prefs.getString('token') ?? _token;
  }

  static String? get uid {
    return _prefs.getString('uid') ?? _uid;
  }

  static String? get id_wallet {
    return _prefs.getString('id_wallet') ?? _id_wallet;
  }

  static String? get public_key {
    return _prefs.getString('public_key') ?? _public_key;
  }

  static String? get mnemonic {
    return _prefs.getString('mnemonic') ?? _mnemonic;
  }

  static String? get userName {
    return _prefs.getString('userName') ?? _userName;
  }

  static String? get local_auth {
    return _prefs.getString('local_auth') ?? _local_auth;
  }

//SETTERS
  static set token(String? token) {
    _token = token;
    _prefs.setString('token', token!);
  }

  static set uid(String? uid) {
    _uid = uid;
    _prefs.setString('uid', uid!);
  }

  static set id_wallet(String? idWallet) {
    _id_wallet = idWallet;
    _prefs.setString('id_wallet', idWallet!);
  }

  static set public_key(String? publicKey) {
    _public_key = publicKey;
    _prefs.setString('public_key', publicKey!);
  }

  static set mnemonic(String? mnemonic) {
    _mnemonic = mnemonic;
    _prefs.setString('mnemonic', mnemonic!);
  }

  static set userName(String? userName) {
    _userName = userName;
    _prefs.setString('userName', userName!);
  }

  static set local_auth(String? localAuth) {
    _local_auth = localAuth;
    _prefs.setString('local_auth', localAuth!);
  }

  static void clear() {
    _uid = null;
    _token = null;
    _id_wallet = null;
    _public_key = null;
    _mnemonic = null;
    _userName = null;
    _local_auth = null;
  }
}
