import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  Map? _userDataFacebook;

  // Google
  var _googleSignin = GoogleSignIn();
  var googleAccount = Rx<GoogleSignInAccount?>(null);

  Map? get loginFace => _userDataFacebook;

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
