import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:instaped/app/componts/instapet_appbar.dart';
import 'package:instaped/app/componts/instapet_buttom.dart';
import 'package:instaped/app/componts/instapet_textformfield.dart';
import 'package:instaped/app/config/ui_config.dart';
import 'package:instaped/app/modules/register/register_page.dart';
import 'package:instaped/app/uteis/paleta_cores.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  static const String ROUTE_PAGE = '/login';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      appBar: InstapetAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (_, constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Form(
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
                      InstapetTextformfield(label: 'E-mail'),
                      const SizedBox(height: 30),
                      InstapetTextformfield(label: 'Senha'),
                      const SizedBox(height: 50),
                      Center(
                        child: InstapetButtom(
                          label: 'ENTRAR',
                          onPressed: () {},
                          width: context.width,
                        ),
                      ),
                      const SizedBox(height: 60),
                      Center(
                        child: Text(
                          '- Ou acesse com sua rede social -',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 35),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton.extended(
                            heroTag: "btnGoogle",
                            onPressed: () {
                              controller.loginGoogle();
                            },
                            icon: Image.asset(
                              'assets/images/google_icon.png',
                              height: 32,
                              width: 32,
                            ),
                            label: Text(
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
                              controller.loginFacebook();
                            },
                            icon: Image.asset(
                              'assets/images/facebook_icon.png',
                              height: 32,
                              width: 32,
                              color: Colors.white,
                            ),
                            label: Text(
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
                          Text(
                            'Não possui uma conta?',
                          ),
                          TextButton(
                            onPressed: () {
                              Get.toNamed(RegisterPage.ROUTE_PAGE);
                            },
                            child:
                                Text('Cadastre-se', style: UiConfig.textBold),
                          ),
                        ],
                      )
                    ],
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
