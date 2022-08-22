import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var systemBarDark = const SystemUiOverlayStyle(
  statusBarBrightness: Brightness.dark,
  statusBarIconBrightness: Brightness.dark,
  statusBarColor: Colors.transparent,
  systemNavigationBarContrastEnforced: true,
);

var systemBarLight = const SystemUiOverlayStyle(
  statusBarBrightness: Brightness.light,
  statusBarIconBrightness: Brightness.light,
  statusBarColor: Colors.transparent,
  systemNavigationBarContrastEnforced: true,
);
