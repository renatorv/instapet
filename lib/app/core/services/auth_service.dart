import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:instaped/app/core/constants/constants.dart';

class AuthService extends GetxService {
  // Um serviço no GetX nunca morre!!!

  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  Future<AuthService> init() async {
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      // if (value != null) {
      //   _isLogged(true);
      // } else {
      //   _isLogged(false);
      // }

      _isLogged(value != null);
    });
  }

  void logout() => _getStorage.write(Constants.USER_KEY, null);

  int? getUserId() => _getStorage.read(Constants.USER_KEY);
}
