import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

// class AuthAppleService with ChangeNotifier {
// final _firebaseAuth = FirebaseAuth.instance;

//   Future<User> signInWithApple({List<Scope> scopes = const []}) async {
//     // 1. perform the sign-in request
//     final result = await TheAppleSignIn.performRequests(
//         [AppleIdRequest(requestedScopes: scopes)]);
//     // 2. check the result
//     switch (result.status) {
//       case AuthorizationStatus.authorized:
//         final appleIdCredential = result.credential!;
//         final oAuthProvider = OAuthProvider('apple.com');
//         final credential = oAuthProvider.credential(
//           idToken: String.fromCharCodes(appleIdCredential.identityToken!),
//           accessToken:
//               String.fromCharCodes(appleIdCredential.authorizationCode!),
//         );
//         final userCredential =
//             await _firebaseAuth.signInWithCredential(credential);
//         final firebaseUser = userCredential.user!;
//         if (scopes.contains(Scope.fullName)) {
//           final fullName = appleIdCredential.fullName;
//           if (fullName != null &&
//               fullName.givenName != null &&
//               fullName.familyName != null) {
//             final displayName = '${fullName.givenName} ${fullName.familyName}';
//             await firebaseUser.updateDisplayName(displayName);
//           }
//         }
//         return firebaseUser;
//       case AuthorizationStatus.error:
//         throw PlatformException(
//           code: 'ERROR_AUTHORIZATION_DENIED',
//           message: result.error.toString(),
//         );

//       case AuthorizationStatus.cancelled:
//         throw PlatformException(
//           code: 'ERROR_ABORTED_BY_USER',
//           message: 'Sign in aborted by user',
//         );
//       default:
//         throw UnimplementedError();
//     }
//   }
// }

class AppleSignInService {
  // https://www.api.ebloqs.com/callbacks/sign_in_with_apple

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
        .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  Future signIn() async {
    print('Apple');

    try {
      final rawNonce = generateNonce();
      final nonce = sha256ofString(rawNonce);
      final appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );
      final OAuthCredential oauthCredential =
          OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );
      final UserCredential credential =
          await FirebaseAuth.instance.signInWithCredential(oauthCredential);

      return credential;
    } on SignInWithAppleAuthorizationException catch (e) {
      print('Error signInWithApple1 = ');
      print('Failed with error code: ${e.code}');
      print(e.message);
      print('========================== ');
      if (e.code == AuthorizationErrorCode.canceled) {
        throw ErrorResponse(message: 'You cancel your login');
      } else if (e.code == AuthorizationErrorCode.failed) {
        throw ErrorResponse(message: 'You failed your login');
      } else if (e.code == AuthorizationErrorCode.invalidResponse) {
        throw ErrorResponse(message: 'invalidResponse');
      } else {
        throw ErrorResponse(message: e.message);
      }
    } on FirebaseAuthException catch (e) {
      print('Error signInWithApple2 = ');
      print('Failed with error code: ${e.code}');
      print(e.message);
      print('========================== ');
      print('Failed with error code: ');
      print(e.message);
      print('========================== ');
      throw ErrorResponse(message: e.message, code: e.code);
    } catch (e) {
      print('Error signInWithApple3 = $e');
      throw ErrorResponse(message: e.toString());
    }
  }

  ErrorResponse({String? message, String? code}) {
    print('Error code: $code message: $message');
  }
}
