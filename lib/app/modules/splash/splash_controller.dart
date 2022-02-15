import 'package:get/get.dart';
import 'package:instaped/app/models/user_logged.dart';
import 'package:instaped/app/modules/home/home_page.dart';
import 'package:instaped/app/modules/login/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final _logged = UserLogged.empty.obs;

  @override
  void onInit() {
    super.onInit();

    ever<UserLogged>(_logged, checkIsLogged);

    checkLogin();
  }

  UserLogged get logged => _logged.value;

  Future<void> checkLogin() async {
    final sp = await SharedPreferences.getInstance();

    await 1.seconds.delay();

    if (sp.containsKey('user')) {
      _logged(UserLogged.authententicate);
    } else {
      _logged(UserLogged.unauthenticate);
    }
  }

  void checkIsLogged(UserLogged userLogged) {
    switch (userLogged) {
      case UserLogged.authententicate:
        // offAllNamed: mata todas as páginas e deixa somente a de destino
        Get.offAllNamed(HomePage.ROUTE_PAGE);
        break;
      case UserLogged.unauthenticate:
        Get.offAllNamed(LoginPage.ROUTE_PAGE);
        break;
      case UserLogged.empty:
      default:
        break;
    }
  }
}
