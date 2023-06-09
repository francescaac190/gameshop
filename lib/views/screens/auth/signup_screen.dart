import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameshop/routes/routes.dart';
import 'package:gameshop/widgets/others/custom_appbar.dart';
import 'package:gameshop/widgets/inputs/input_field_widget.dart';
import 'package:get/get.dart';

import '../../../controller/auth/signup_controller.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';
import '../../../utils/strings.dart';
import '../../../widgets/buttons/primary_button_widget.dart';
import '../../../widgets/inputs/password_input_field.dart';
import '../../../widgets/inputs/phone_number_input_textfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final SignUpController controller = Get.put(SignUpController());
  final signupFormKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryBackgroundColor,
      appBar: CustomAppBar(Strings.signUp),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(() => ListView(
          children: [
            _titleWidget(context),
            _inputWidget(context),
            _privacyPolicy(),
            _signUpButtonWidget(context),
            _alreadyHaveAnAccount(context)
          ],
        ));
  }

  _titleWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.marginSize,
      ),
      child: Text(
        Strings.createNewAccount,
        textAlign: TextAlign.center,
        style: CustomStyle.defaultTitleStyle,
      ),
    );
  }

  _inputWidget(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
        child: Form(
          key: signupFormKey,
          child: Column(
            children: [
              InputFieldWidget(
                labelText: Strings.email,
                hintText: Strings.enterEmail,
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
              ),
              PhoneNumberInputTextFieldWidget(
                labelText: Strings.mobile,
                hintText: Strings.mobileHint,
                keyboardType: TextInputType.number,
                controller: controller.phoneNumberController,
              ),
              PasswordInputField(
                labelText: Strings.yourPassword,
                hintText: Strings.enterPassword,
                keyboardType: TextInputType.visiblePassword,
                controller: controller.newPasswordController,
              ),
            ],
          ),
        ));
  }

  _signUpButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Dimensions.marginSize,
          vertical: Dimensions.heightSize * 5),
      child: PrimaryButtonWidget(
        text: Strings.singUp,
        onPressed: () {
          Get.toNamed(Routes.emailVerificationScreen);
        },
      ),
    );
  }

  _privacyPolicy() {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.heightSize,
      ),
      child: Row(
        crossAxisAlignment: crossStart,
        mainAxisAlignment: mainSpaceBet,
        children: [
          Row(
            mainAxisAlignment: mainStart,
            children: [
              SizedBox(
                width: 21.w,
                height: 8.h,
                child: Checkbox(
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.radius * 0.5)),
                  fillColor: MaterialStateProperty.all(Colors.transparent),
                  value: controller.termsAndCondition.value,
                  onChanged: controller.termsAndCondition,
                  activeColor: CustomColor.secondaryColor,
                  checkColor: CustomColor.secondaryColor,
                  side: MaterialStateBorderSide.resolveWith(
                    (states) => const BorderSide(
                      width: 1.4,
                      color: CustomColor.secondaryColor,
                    ),
                  ),
                ),
              ),
              addHorizontalSpace(8.9.w),
              _userAgreement()
            ],
          ),
        ],
      ),
    );
  }

  _alreadyHaveAnAccount(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          children: [
            TextSpan(
              text: Strings.alreadyHaveAnAccount,
              style: CustomStyle.defaultSubTitleStyle,
            ),
            TextSpan(
              text: Strings.signIn,
              style: CustomStyle.policyOrUserAgreementTextStyle,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(Routes.signInScreen);
                },
            ),
          ],
        ),
      ),
    );
  }

  _userAgreement() {
    return RichText(
      text: TextSpan(
        text: Strings.agree,
        style: CustomStyle.defaultSubTitleStyle,
        children: <TextSpan>[
          TextSpan(
            text: Strings.privacy,
            recognizer: TapGestureRecognizer()..onTap = () {},
            style: CustomStyle.policyOrUserAgreementTextStyle,
          ),
          TextSpan(
            text: Strings.and,
            style: CustomStyle.defaultSubTitleStyle,
          ),
          TextSpan(
            text: Strings.policy,
            recognizer: TapGestureRecognizer()..onTap = () {},
            style: CustomStyle.policyOrUserAgreementTextStyle,
          ),
        ],
      ),
    );
  }
}
