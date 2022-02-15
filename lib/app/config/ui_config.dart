import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instaped/app/modules/home/home.dart';
import 'package:instaped/app/modules/login/login.dart';
import 'package:instaped/app/modules/splash/splash.dart';

class UiConfig {
  // construtor nomeado privado
  UiConfig._();

  static final appTheme = ThemeData(
    primaryColor: Color(0xFFF5591F),
    primarySwatch: Colors.orange,
  );

  static final routes = <GetPage>[
    GetPage(
      name: SplashPage.ROUTE_PAGE,
      page: () => SplashPage(),
      binding: SplashBindings(),
    ),
    GetPage(
      name: HomePage.ROUTE_PAGE,
      page: () => HomePage(),
      binding: HomeBindings(),
    ),
    GetPage(
      name: LoginPage.ROUTE_PAGE,
      page: () => LoginPage(),
      binding: LoginBindings(),
    ),
  ];
}
