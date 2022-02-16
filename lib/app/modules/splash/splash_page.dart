import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:instaped/app/modules/login/login.dart';
import 'package:lottie/lottie.dart';
import './splash_controller.dart';

class SplashPage extends StatefulWidget {
  static const String ROUTE_PAGE = '/';

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(vsync: this);
    _animationController.duration = Duration(seconds: 10);
    // _animationController.repeat();
    _animationController.forward().whenComplete(() => Get.toNamed(LoginPage.ROUTE_PAGE));

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   Future.delayed(Duration(seconds: 6), () {
  //     Get.toNamed(LoginPage.ROUTE_PAGE);
  //   });
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('SplashPage'),
      // ),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 300,
          child: Lottie.asset('assets/lotties/pata.json', controller: _animationController),
          // child: Lottie.asset('assets/lotties/pata.json',
          //     controller: _animationController, onLoaded: (animation) {
          //   _animationController
          //     ..duration = animation.duration * 5
          //     ..repeat(reverse: true);
          // }),
        ),
      ),
      // body: Container(
      //   child: Obx(
      //     () => Text(
      //       controller.logged.toString(),
      //     ),
      //   ),
      // ),
    );
  }
}
// testar: https://www.youtube.com/watch?v=1HlNkO1S6Kg