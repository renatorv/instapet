import 'package:get/get.dart';
import 'package:instaped/app/repositories/auth/auth_repository.dart';
import 'package:instaped/app/repositories/auth/auth_repository_impl.dart';
import './register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
        () => AuthRepositoryImpl(restClient: Get.find()));
    Get.lazyPut(() => RegisterController(authRepository: Get.find()));
  }
}
