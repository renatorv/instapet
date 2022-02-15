import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  static const String ROUTE_PAGE = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SplashPage'),
      ),
      body: Container(
        child: Obx(
          () => Text(
            controller.logged.toString(),
          ),
        ),
      ),
    );
  }
}
