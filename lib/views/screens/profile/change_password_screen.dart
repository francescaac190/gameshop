import 'package:flutter/material.dart';
import 'package:gameshop/utils/size.dart';
import 'package:gameshop/widgets/inputs/password_input_field.dart';
import 'package:gameshop/widgets/others/custom_appbar.dart';
import 'package:get/get.dart';

import '../../../controller/profile/change_password_controller.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/strings.dart';
import '../../../widgets/buttons/primary_button_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({Key? key}) : super(key: key);
  final controller = Get.put(ChangePasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryBackgroundColor,
      appBar: CustomAppBar(
        Strings.changePassword,
      ),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
      child: ListView(
        children: [
          _inputWidget(context),
          _changePasswordButton(context),
        ],
      ),
    );
  }

  _inputWidget(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          PasswordInputField(
            hintText: Strings.enterOldPassword,
            labelText: Strings.oldPassword,
            controller: controller.oldPasswordController,
          ),
          PasswordInputField(
            hintText: Strings.enterNewPassword,
            labelText: Strings.newPassword,
            controller: controller.newPasswordController,
          ),
          PasswordInputField(
            hintText: Strings.enterConfirmPassword,
            labelText: Strings.confirmPassword,
            controller: controller.confirmPasswordController,
          ),
        ],
      ),
    );
  }

  _changePasswordButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: PrimaryButtonWidget(
        text: Strings.changePassword,
        onPressed: () {
          Get.back();
        },
      ),
    );
  }
}
