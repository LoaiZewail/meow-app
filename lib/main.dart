import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meow/landing.dart';

import 'home.dart';

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Landing(),
        routes: {
          ForcePicRefresh.id: (context) => ForcePicRefresh(),
        });
  }
}
