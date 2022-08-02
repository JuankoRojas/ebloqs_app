import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInService {
  static final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['email'],
  );

  static Future<GoogleSignInAccount> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? account = await _googleSignIn.signIn();
      final googleKey = await account!.authentication;

      print(account);
      print('======== ID TOKEN ========= ');
      print(googleKey.idToken);

      // TODO: Llamar un servicio REST a nuestro backend
      // con el ID Token

      return account;
    } on GoogleSignInAccount catch (e) {
      print('Error en google Signin');
      print(e);
      return e;
    }
  }

  static Future signOut() async {
    await _googleSignIn.signOut();
  }
}
