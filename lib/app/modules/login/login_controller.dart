import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:instaped/app/core/constants/constants.dart';
import 'package:instaped/app/core/exceptions/user_notfound_exception.dart';
import 'package:instaped/app/core/mixins/loader_mixin.dart';
import 'package:instaped/app/core/mixins/message_mixin.dart';
import 'package:instaped/app/models/user_logged.dart';
import 'package:instaped/app/repositories/auth/auth_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final AuthRepository _authRepository;

  LoginController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Map? _userDataFacebook;

  // Google
  var _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  Map? get loginFace => _userDataFacebook;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> login({required String email, required String password}) async {
    try {
      _loading.toggle();

      final userLogged = await _authRepository.login(email, password);

      // Guardar o usuário logado
      final storage = GetStorage();
      storage.write(
        Constants.USER_KEY,
        userLogged.id,
      ); // creio que vou precisar de tudo

      _loading.toggle();
    } on UserNotfoundException catch (e, s) {
      _loading.toggle();
      log('Login ou senha inválidos.', error: e, stackTrace: s);
      _message(MessageModel(
          title: 'Erro',
          message: 'Login ou senha inválidos.',
          type: MessageType.error));
    }
    //Erro genérico
    catch (e, s) {
      _loading.toggle();
      log('Erro ao realizar login.', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao realizar login.',
          type: MessageType.error,
        ),
      );
    }
  }

  Future loginFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      // you are logged
      final AccessToken accessToken = result.accessToken!;

      print(accessToken.applicationId);

      final requestData = await FacebookAuth.i.getUserData(
        fields: "email, name, picture",
      );

      print(requestData);
      print(requestData['picture']);
    } else {
      print(result.status);
      print(result.message);
    }
    // final result = await FacebookAuth.i.login(
    //   permissions: ['email', 'public_profile'],
    // );

    // print(result.status);

    // if (result.status == LoginStatus.success) {
    //   final requestData = await FacebookAuth.i.getUserData(
    //     fields: "email, name",
    //   );
    //   _userDataFacebook = requestData;
    //   update();
    // }
  }

  Future loginGoogle() async {
    try {
      googleAccount.value = await _googleSignin.signIn();

      print(googleAccount.value?.displayName ?? '');
      print(googleAccount.value?.email ?? '');
      print(googleAccount.value?.photoUrl ?? '');

      update();
    } catch (e) {
      print(e.toString());
    }

    if (googleAccount.value != null) {
      Get.toNamed('/home');
    }
  }

  Future logoutGoogle() async {
    googleAccount.value = await _googleSignin.disconnect();

    FirebaseAuth.instance.signOut();

    update();
  }
}
