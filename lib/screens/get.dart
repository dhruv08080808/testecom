import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  var _googlesign = GoogleSignIn();
  var googleacc = Rx<GoogleSignInAccount?>(null);

  login() async {
    googleacc.value = await _googlesign.signIn();
  }
}
