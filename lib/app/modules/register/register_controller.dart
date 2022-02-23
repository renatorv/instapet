import 'dart:developer';

import 'package:get/get.dart';
import 'package:instaped/app/core/mixins/loader_mixin.dart';
import 'package:instaped/app/core/mixins/message_mixin.dart';
import 'package:instaped/app/core/rest_client/rest_client.dart';
import 'package:instaped/app/repositories/auth/auth_repository.dart';

class RegisterController extends GetxController with LoaderMixin, MessageMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  @override
  void onInit() {
    loaderListener(_loading);
    messageListener(_message);
    super.onInit();
  }

  RegisterController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();

      await _authRepository.register(name, email, password);

      _loading.toggle();

      // TODO: voltar quando fizer login

      Get.back();

      _message(
        MessageModel(
          title: 'Sucesso',
          message: 'Cadastro realizado com sucesso!',
          type: MessageType.info,
        ),
      );
    } on RestClientException catch (e, s) {
      _loading.toggle();
      log('Erro ao registra usuário', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao registra usuário', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao registra usuário',
          type: MessageType.error,
        ),
      );
    }
  }
}


parei em 1h e 17 do dia 2
Realizar o cadastro!!