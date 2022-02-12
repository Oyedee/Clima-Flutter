import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:clima/screens/loading_screen.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(DevicePreview(
      builder: (context) => MyApp(),
      enabled: !kReleaseMode,
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
