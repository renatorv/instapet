import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:instaped/app/componts/instapet_textformfield.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  static const String ROUTE_PAGE = '/login';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: Get.mediaQuery.size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/cropped-akps_header.png',
                width: 400,
              ),
              SizedBox(
                child: Column(
                  children: [
                    InstapetTextformfield(label: 'E-mail'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
