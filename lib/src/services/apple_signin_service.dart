import 'dart:io';

import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:http/http.dart' as http;

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
  static void signIn() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ]);
      final signInWithAppleEndPoint = Uri(
          scheme: 'https',
          host: 'api.ebloqs.com',
          path: '/sign_in_with_apple',
          queryParameters: {
            'code': credential.authorizationCode,
            'firstName': credential.givenName,
            'lastName': credential.familyName,
            'useBundleId': Platform.isIOS ? 'true' : 'false',
            if (credential.state != null) 'state': credential.state,
          });
      final session = await http.post(signInWithAppleEndPoint);
    } catch (e) {
      print('Error en sign in with apple');
      print(e);
    }
  }
}
