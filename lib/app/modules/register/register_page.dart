import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:instaped/app/componts/instapet_appbar.dart';
import 'package:instaped/app/componts/instapet_buttom.dart';
import 'package:instaped/app/componts/instapet_textformfield.dart';
import 'package:instaped/app/core/insta_state.dart';
import 'package:validatorless/validatorless.dart';
import './register_controller.dart';

class RegisterPage extends StatefulWidget {
  static const String ROUTE_PAGE = '/register';
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends InstaState<RegisterPage, RegisterController> {
  final _formKey = GlobalKey<FormState>();
  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();

  @override
  void dispose() {
    _nameEC.dispose();
    _emailEC.dispose();
    _passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: InstapetAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: IntrinsicHeight(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline4?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark),
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style: context.textTheme.bodyText1,
                  ),
                  const SizedBox(height: 30),
                  InstapetTextformfield(
                    label: 'Nome',
                    controller: _nameEC,
                    validator: Validatorless.multiple([
                      Validatorless.required('Nome ?? obrigat??rio.'),
                      Validatorless.min(
                        6,
                        'Nome deve conter pelo menos 6 caracteres.',
                      ),
                    ]),
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
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  InstapetTextformfield(
                    label: 'Confirma senha',
                    obscureText: true,
                    validator: Validatorless.multiple(
                      [
                        Validatorless.required('Confirma senha ?? obrigat??ria.'),
                        Validatorless.min(
                          6,
                          'Senha deve conter pelo menos 6 caracteres.',
                        ),
                        Validatorless.compare(
                          _passwordEC,
                          'Senhas n??o conferem.',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: InstapetButtom(
                      label: 'CADASTRAR',
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;

                        if (formValid) {
                          controller.register(
                            name: _nameEC.text,
                            email: _emailEC.text,
                            password: _passwordEC.text,
                          );
                        }
                      },
                      width: context.width,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
