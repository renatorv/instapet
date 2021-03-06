import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instaped/app/modules/home/home.dart';
import 'package:instaped/app/modules/login/login.dart';
import 'package:instaped/app/modules/register/register_bindings.dart';
import 'package:instaped/app/modules/register/register_page.dart';
import 'package:instaped/app/modules/splash/splash.dart';

class UiConfig {
  // construtor nomeado privado
  UiConfig._();

  static final appTheme = ThemeData(
    fontFamily: 'Roboto',
    primaryColor: Color(0xFFF5591F),
    primarySwatch: Colors.orange,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: const Color(0xFFF5591F),
        // textStyle: const TextStyle(fontFamily: ''),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.black,
      selectedIconTheme: const IconThemeData(color: Colors.black),
      selectedLabelStyle: textBold,
      unselectedItemColor: Colors.grey[400],
      unselectedIconTheme: IconThemeData(color: Colors.grey[400]),
    ),
  );

  static const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);

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
    GetPage(
      name: RegisterPage.ROUTE_PAGE,
      page: () => RegisterPage(),
      binding: RegisterBindings(),
    ),
  ];
}
