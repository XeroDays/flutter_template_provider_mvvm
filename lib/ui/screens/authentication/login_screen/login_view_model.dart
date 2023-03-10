import 'package:flutter/material.dart';
import 'package:template_provider_mvvm/core/enums/view_state.dart';
import 'package:template_provider_mvvm/core/others/base_view_model.dart';
import 'package:template_provider_mvvm/core/others/logger_customization/custom_logger.dart';
import 'package:template_provider_mvvm/core/services/authentication/firebase/fire_auth.dart';
import 'package:template_provider_mvvm/locator.dart';

class LoginViewModel extends BaseViewModel {
  final log = CustomLogger(className: 'LoginViewModel');
  bool isRememberMe = false;
  FireAuth authService = locator<FireAuth>();
  // LoginBody loginBody = LoginBody();
  // late AuthResponse response;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordVisibility = true;

  togglePasswordVisibility() {
    setState(ViewState.busy);
    passwordVisibility = !passwordVisibility;
    setState(ViewState.idle);
  }

  requestLogin() async {
    setState(ViewState.busy);
    try {
      await authService.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } catch (e, s) {
      log.d("@LoginViewModel requestLogin Exceptions : $e");
      log.d(s);
    }
    setState(ViewState.idle);
  }

  toggleIsRememberMe() {
    debugPrint('@toggleIsRememberMe: isRememberMe: $isRememberMe');
    isRememberMe = !isRememberMe;
    notifyListeners();
  }
}
