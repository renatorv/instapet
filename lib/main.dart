import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instaped/app/config/ui_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instaped/app/core/bindings/application_binding.dart';

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: UiConfig.appTheme,
      getPages: UiConfig.routes,
      initialBinding: ApplicationBinding(),
    );
  }
}

/// Criação do rest client:
/// 37 minutos do dia 1 no curso de 22
/// 
/// Utilização do Get Storage:
/// 43 minutos do dia 1 no curso de 22
/// 
///  Utilização do Textformfield:
/// 46 minutos do dia 1 no curso de 22
/// 
/// Parei em 55 minutos do curso de 22
/// 
/// Lotties Files: https://lottiefiles.com/private/animations
