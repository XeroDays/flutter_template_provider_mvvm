import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:template_provider_mvvm/core/enums/view_state.dart';
import 'package:template_provider_mvvm/core/others/base_view_model.dart';
import 'package:template_provider_mvvm/core/services/authentication/firebase/fire_auth.dart';
import 'package:template_provider_mvvm/locator.dart';
import 'package:template_provider_mvvm/ui/custom_widgets/dialogs/auth_dialog.dart';

class ForgetPasswordScreenViewModel extends BaseViewModel {
  FireAuth authService = locator<FireAuth>();
  //ResetPasswordBody resetPasswordBody = ResetPasswordBody();
  TextEditingController emailController = TextEditingController();
  //late ResetPasswordResponse response;

  resetPassword() async {
    setState(ViewState.busy);
    bool emailSent = await authService.resetPassword(emailController.text);
    if (!emailSent) {
      Get.dialog(
        const AuthDialog(
            title: 'Error', message: 'Failed to send password reset email'),
      );
    }
    setState(ViewState.idle);
    Get.back();
  }
}
