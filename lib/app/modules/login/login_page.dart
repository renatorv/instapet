import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:instaped/app/componts/instapet_appbar.dart';
import 'package:instaped/app/componts/instapet_buttom.dart';
import 'package:instaped/app/componts/instapet_textformfield.dart';
import 'package:instaped/app/config/ui_config.dart';
import 'package:instaped/app/core/insta_state.dart';
import 'package:instaped/app/modules/register/register_page.dart';
import 'package:instaped/app/uteis/paleta_cores.dart';
import 'package:validatorless/validatorless.dart';
import './login_controller.dart';

class LoginPage extends StatefulWidget {
  static const String ROUTE_PAGE = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends InstaState<LoginPage, LoginController> {
  final _formKeyLogin = GlobalKey<FormState>();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstapetAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKeyLogin,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: context.textTheme.headline4?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: context.theme.primaryColorDark),
                        ),
                        const SizedBox(height: 30),
                        InstapetTextformfield(
                          label: 'E-mail',
                          controller: _emailEC,
                          validator: Validatorless.multiple(
                            [
                              Validatorless.required('E-mail ?? obrigat??rio.'),
                              Validatorless.email('E-mail inv??lido.')
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        InstapetTextformfield(
                          label: 'Senha',
                          obscureText: true,
                          controller: _passwordEC,
                          validator: Validatorless.multiple(
                            [
                              Validatorless.required('Senha ?? obrigat??ria.'),
                              Validatorless.min(
                                6,
                                'Senha deve conter pelo menos 6 caracteres.',
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 50),
                        Center(
                          child: InstapetButtom(
                            label: 'ENTRAR',
                            onPressed: () {
                              final formValid =
                                  _formKeyLogin.currentState?.validate() ??
                                      false;
                              if (formValid) {
                                controller.login(
                                  email: _emailEC.text,
                                  password: _passwordEC.text,
                                );
                              }
                            },
                            width: context.width,
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Center(
                          child: Text(
                            '- Ou acesse com sua rede social -',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            FloatingActionButton.extended(
                              heroTag: "btnGoogle",
                              onPressed: () {
                                //controller.loginGoogle();
                              },
                              icon: Image.asset(
                                'assets/images/google_icon.png',
                                height: 32,
                                width: 32,
                              ),
                              label: const Text(
                                'Google',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                            ),
                            FloatingActionButton.extended(
                              heroTag: "btnFacebook",
                              onPressed: () {
                                //controller.loginFacebook();
                              },
                              icon: Image.asset(
                                'assets/images/facebook_icon.png',
                                height: 32,
                                width: 32,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Facebook',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              backgroundColor: PaletaCores.azulFacebook,
                              foregroundColor: Colors.black,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'N??o possui uma conta?',
                            ),
                            TextButton(
                              onPressed: () {
                                Get.toNamed(RegisterPage.ROUTE_PAGE);
                              },
                              child: const Text('Cadastre-se',
                                  style: UiConfig.textBold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
