import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instaped/app/config/ui_config.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: UiConfig.appTheme,
      getPages: UiConfig.routes,
    );
  }
}
