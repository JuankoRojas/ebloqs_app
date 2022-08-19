import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInService {
  static Future facebookLogin() async {
    bool isLoggInFacebook = false;
    try {
      final LoginResult result = await FacebookAuth.instance.login(
        permissions: [
          'public_profile',
          'email',
        ],
      );

      if (result.status == LoginStatus.success) {
        final Map<String, dynamic> userData =
            await FacebookAuth.instance.getUserData();

        return userData;
      }

      isLoggInFacebook = true;
    } catch (e) {
      print(e);
      isLoggInFacebook = false;
    }
  }

  static Future facebookSignOut() async {
    await FacebookAuth.instance.logOut();
  }
}
