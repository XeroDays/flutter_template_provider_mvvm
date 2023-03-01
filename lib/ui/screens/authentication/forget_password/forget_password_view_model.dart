import 'package:flutter/material.dart';

import '../../../../core/constants/utils.dart';
import '../../../../core/enums/view_state.dart';
import '../../../../core/others/base_view_model.dart';
import '../../../../core/services/authentication/firebase/fire_auth.dart';
import '../../../../locator.dart';
import '../../../custom_widgets/dialogs/auth_dialog.dart';

class ForgetPasswordScreenViewModel extends BaseViewModel {
  FireAuth authService = locator<FireAuth>();
  //ResetPasswordBody resetPasswordBody = ResetPasswordBody();
  TextEditingController emailController = TextEditingController();
  //late ResetPasswordResponse response;

  resetPassword(context) async {
    setState(ViewState.busy);
    bool emailSent = await authService.resetPassword(emailController.text);
    if (!emailSent) {
      show_dialog(AuthDialog(
          title: 'Error', message: 'Failed to send password reset email'));
    }
    setState(ViewState.idle);
    Navigator.pop(context);
  }
}
