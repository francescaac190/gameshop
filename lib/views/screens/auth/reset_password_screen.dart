import 'package:flutter/material.dart';
import 'package:gameshop/utils/assets.dart';
import 'package:gameshop/utils/strings.dart';
import 'package:gameshop/widgets/others/custom_appbar.dart';
import 'package:get/get.dart';
import '../../../controller/auth/reset_password_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';
import '../../../widgets/buttons/primary_button_widget.dart';
import '../../../widgets/inputs/password_input_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  final _controller = Get.put(ResetPasswordController());
  final resetPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryBackgroundColor,
      appBar: CustomAppBar(
        Strings.resetPassword,
        centerTitle: true,
        alwaysShowBackButton: false,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        _inputWidget(context),
        _resetButtonWidget(context),
      ],
    );
  }

  _inputWidget(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(Dimensions.marginSize),
        child: Form(
            key: resetPasswordFormKey,
            child: Column(
              crossAxisAlignment: crossStart,
              children: [
                PasswordInputField(
                  labelText: Strings.newPassword,
                  hintText: Strings.enterNewPassword,
                  keyboardType: TextInputType.visiblePassword,
                  controller: _controller.newPasswordController,
                ),
                PasswordInputField(
                  labelText: Strings.confirmPassword,
                  hintText: Strings.enterConfirmPassword,
                  keyboardType: TextInputType.visiblePassword,
                  controller: _controller.confirmPasswordController,
                ),
              ],
            )));
  }

  _resetButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize,
        vertical: Dimensions.marginSize * 1.5,
      ),
      alignment: Alignment.centerRight,
      child: PrimaryButtonWidget(
        text: Strings.resetPassword,
        onPressed: () {
          Get.toNamed(Routes.congratulations, arguments: [
            StaticAssets.success,
            Strings.congratulations,
            Strings.passwordRestSuccessfully,
            Routes.signInScreen,
          ]);
        },
      ),
    );
  }
}
