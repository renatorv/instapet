import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:instaped/app/componts/instapet_appbar.dart';
import 'package:instaped/app/componts/instapet_buttom.dart';
import 'package:instaped/app/componts/instapet_textformfield.dart';
import './register_controller.dart';

class RegisterPage extends GetView<RegisterController> {
  static const String ROUTE_PAGE = '/register';
  const RegisterPage({Key? key}) : super(key: key);

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Cadastro',
                    style: context.textTheme.headline6?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.theme.primaryColorDark),
                  ),
                  Text(
                    'Preencha os campos abaixo para criar o seu cadastro.',
                    style: context.textTheme.bodyText1,
                  ),
                  const SizedBox(height: 30),
                  InstapetTextformfield(label: 'Nome'),
                  const SizedBox(height: 30),
                  InstapetTextformfield(label: 'E-mail'),
                  const SizedBox(height: 30),
                  InstapetTextformfield(
                    label: 'Senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  InstapetTextformfield(
                    label: 'Confirma senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 50),
                  Center(
                    child: InstapetButtom(
                      label: 'CADASTRAR',
                      onPressed: () {},
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
