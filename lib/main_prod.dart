import 'package:camera/camera.dart';
import 'package:ebloqs_app/bootstrap.dart';
import 'package:ebloqs_app/src/app/app.dart';
import 'package:ebloqs_app/src/app/app_config.dart';
import 'package:ebloqs_app/src/providers/apple_sign_in_available.dart';
import 'package:ebloqs_app/src/shared/shared_preferences.dart';
import 'package:ebloqs_app/src/utils/tabbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

late List<CameraDescription> _cameras;
void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setSystemUIOverlayStyle(systemBarDark);
  await Firebase.initializeApp();
  await Preferences.init();
  _cameras = await availableCameras();
  // var locationProvider = LocationsProvider();
  // locationProvider.useMyLocation();
  Provider.debugCheckInvalidValueType = null;
  final appleSignInAvailable = await AppleSignInAvailable.check();
  AppConfig.instance.init(environment: Environment.prod);

  bootstrap(() => Provider<AppleSignInAvailable>.value(
        value: appleSignInAvailable,
        child: const MyApp(),
      ));
}
