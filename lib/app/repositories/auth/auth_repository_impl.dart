import 'dart:developer';

import 'package:instaped/app/core/exceptions/user_notfound_exception.dart';
import 'package:instaped/app/core/rest_client/rest_client.dart';
import 'package:instaped/app/models/user_model.dart';
import 'package:instaped/app/repositories/auth/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;
  AuthRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post(
      '/sign-up',
      {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (result.hasError) {
      var message = 'Erro ao registrar usuário.';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }

      log(
        message,
        error: result.statusText,
        stackTrace: StackTrace.current,
      );

      throw RestClientException(message);
    }

    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post('/login', {
      'email': email,
      'password': password,
    });

    if (result.hasError) {
      if (result.statusCode == 403) {
        log(
          'Usuário ou senha inválidos.',
          error: result.statusText,
          stackTrace: StackTrace.current,
        );

        throw UserNotfoundException();
      }
      log(
        'Erro ao autentica usuário(${result.statusCode})',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException('Erro ao autenticar usuário.');
    }

    log('\n');
    print(result.body);
    TRATAR
    // {result: {username: teste, email: teste@gmail.com, name: Teste, createdAt: 2022-02-24T11:41:15.928Z,
    //updatedAt: 2022-02-24T11:41:15.928Z,
    //ACL: {*: {read: true},
    //eKWnw14fCQ: {read: true, write: true}},
    //sessionToken: r:3010f7fc38e2084e2ccb6036cca503c5,
    //objectId: eKWnw14fCQ, __type: Object, className: _User}}
    log(result.body);

    return UserModel.fromMap(result.body);
  }
}
