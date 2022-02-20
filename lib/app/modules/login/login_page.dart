import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:instaped/app/componts/instapet_appbar.dart';
import 'package:instaped/app/componts/instapet_buttom.dart';
// import 'package:instaped/app/componts/instapet_buttom.dart';
import 'package:instaped/app/componts/instapet_textformfield.dart';
import 'package:instaped/app/config/ui_config.dart';
// import 'package:social_login_buttons/social_login_buttons.dart';
import './login_controller.dart';

class LoginPage extends GetView<LoginController> {
  static const String ROUTE_PAGE = '/login';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      appBar: InstapetAppbar(elevation: 0),
      backgroundColor: Colors.white,
      body: LayoutBuilder(builder: (_, constraints) {
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
                      style: context.textTheme.headline6?.copyWith(
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
                        label: 'FACEBOOK',
                        onPressed: () {
                          controller.loginFacebook();
                        },
                      ),
                    ),

                    const SizedBox(height: 12),

                    Obx(() {
                      return Center(
                        child: Text(controller.googleAccount.value == null
                            ? 'não autenticado'
                            : 'autenticado'),
                      );
                    }),

                    const SizedBox(height: 12),

                    Center(
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          controller.loginGoogle();
                        },
                        icon: Image.asset(
                          'assets/images/google_icon.png',
                          height: 32,
                          width: 32,
                        ),
                        label: Text(
                          'Login com Google',
                        ),
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                    ),

                    // Center(
                    //   child: InstapetButtom(
                    //     label: 'ENTRAR',
                    //     onPressed: () {},
                    //     width: context.width,
                    //   ),
                    // ),
                    // const SizedBox(height: 30),
                    // Center(
                    //   child: Text(
                    //     '- ou acesse com sua rede social -',
                    //     // style: context.textTheme.bodyText1,
                    //     style: context.textTheme.bodyText1?.copyWith(
                    //         fontWeight: FontWeight.bold,
                    //         color: context.theme.primaryColorDark),
                    //   ),
                    // ),
                    const SizedBox(height: 30),
                    // SocialLoginButton(
                    //   buttonType: SocialLoginButtonType.google,
                    //   onPressed: () {},
                    //   text: 'Login com Google',
                    //   borderRadius: 26,
                    // ),
                    const SizedBox(height: 10),
                    // SocialLoginButton(
                    //   buttonType: SocialLoginButtonType.facebook,
                    //   onPressed: () {},
                    //   text: 'Login com Facebook',
                    //   borderRadius: 26,
                    // ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Não possui uma conta?',
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed('/register');
                          },
                          child: Text('Cadastre-se', style: UiConfig.textBold),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
    // return Scaffold(
    //   appBar: InstapetAppbar(elevation: 0),
    //   backgroundColor: Colors.white,
    //   body: SizedBox(
    //     width: Get.mediaQuery.size.width,
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.center,
    //       children: [
    //         // Image.asset(
    //         //   'assets/images/cropped-akps_header.png',
    //         //   width: 400,
    //         // ),
    //         Padding(
    //           padding: const EdgeInsets.all(10),
    //           child: Column(
    //             children: [
    //               InstapetTextformfield(label: 'E-mail'),
    //             ],
    //           ),
    //         ),
    //         const SizedBox(height: 20),
    //         InstapetButtom(label: 'Entrar', onPressed: () {})
    //       ],
    //     ),
    //   ),
    // );
  }
}
