import 'package:flutter/material.dart';
import 'package:the_apple_sign_in/the_apple_sign_in.dart';

class AppleSignInAvailable with ChangeNotifier {
  AppleSignInAvailable(this.isAvailable);
  final bool isAvailable;

  static Future<AppleSignInAvailable> check() async {
    return AppleSignInAvailable(await TheAppleSignIn.isAvailable());
  }
}
