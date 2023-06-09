import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameshop/utils/assets.dart';
import 'package:gameshop/widgets/others/custom_appbar.dart';
import 'package:gameshop/widgets/inputs/input_field_widget.dart';
import 'package:gameshop/widgets/others/svg_icon.dart';
import 'package:get/get.dart';

import '../../../controller/auth/forgot_password_controller.dart';
import '../../../controller/auth/signin_controller.dart';
import '../../../routes/routes.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';
import '../../../utils/strings.dart';
import '../../../widgets/buttons/primary_button_widget.dart';
import '../../../widgets/inputs/password_input_field.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  final SignInController controller = Get.put(SignInController());
  final loginFormKey = GlobalKey<FormState>();
  final forgotPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryBackgroundColor,
      appBar: CustomAppBar(Strings.signIn),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
      children: [
        _titleWidget(context),
        _inputWidget(context),
        _forgotPassWidget(context),
        _signInButtonAndCreateAccountWidget(context),
      ],
    );
  }

  _titleWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.marginSize * 1.5,),
      child: Text(
        Strings.loginToYourAccount,
        textAlign: TextAlign.center,
        style: CustomStyle.defaultTitleStyle,
      ),
    );
  }

  _inputWidget(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
        child: Form(
          key: loginFormKey,
          child: Column(
            children: [
              InputFieldWidget(
                labelText: Strings.userNameOrEmail,
                hintText: Strings.enterUserNameOrEmail,
                keyboardType: TextInputType.emailAddress,
                controller: controller.emailController,
              ),
              PasswordInputField(
                labelText: Strings.password,
                hintText: Strings.enterPassword,
                keyboardType: TextInputType.visiblePassword,
                controller: controller.passwordController,
              ),
            ],
          ),
        ));
  }

  _forgotPassWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize * 1.1,
        vertical: Dimensions.marginSize * 0.2,
      ),
      child: Row(
        mainAxisAlignment: mainEnd,
        children: [
          GestureDetector(
            onTap: () {
              _openDialogue(context);
            },
            child: Text(
              Strings.forgotPassword,
              style: CustomStyle.forgotPasswordStyle,
            ),
          )
        ],
      ),
    );
  }

  _signInButtonAndCreateAccountWidget(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
            horizontal: Dimensions.marginSize,
            vertical: Dimensions.heightSize * 3.5),
        child: Column(
          crossAxisAlignment: crossCenter,
          children: [
            addVerticalSpace(10.h),
            PrimaryButtonWidget(
              text: Strings.signIn,
              onPressed: () {
                Get.offAndToNamed(Routes.dashBoardScreen);
              },
            ),
            GestureDetector(
              child: Padding(
                padding: EdgeInsets.only(
                  top: Dimensions.defaultPaddingSize * 0.4,
                  bottom: Dimensions.defaultPaddingSize * 1.5,
                ),
                child: Text(
                  Strings.guestSingin,
                  style: CustomStyle.defaultSubTitleStyle,
                ),
              ),
              onTap: () {
                Get.offAndToNamed(Routes.dashBoardScreen);
              },
            ),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: Strings.dontHaveAnAccount,
                style: CustomStyle.defaultSubTitleStyle,
                children: <TextSpan>[
                  TextSpan(
                    text: Strings.createNew,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Get.toNamed(Routes.signUpScreen);
                      },
                    style: CustomStyle.forgotPasswordStyle,
                  ),
                ],
              ),
            ),
          ],
        ));
  }

  _openDialogue(BuildContext context) {
    ForgotPasswordController controller = Get.put(ForgotPasswordController());
    return showDialog(
        context: context,
        builder: (_)=> AlertDialog(
            backgroundColor: CustomColor.whiteColor,
            alignment: Alignment.center,
            insetPadding: EdgeInsets.all(Dimensions.defaultPaddingSize * 0.5),
            contentPadding: EdgeInsets.zero,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)),
            content: Builder(
              builder: (context) {
                var height = MediaQuery.of(context).size.height;
                var width = MediaQuery.of(context).size.width;
                return Container(
                  width: width * 0.85,
                  height: height * 0.5,
                  padding: EdgeInsets.all(Dimensions.defaultPaddingSize * 0.5),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SvgIcon(
                            asset: StaticAssets.cross,
                            height: 18,
                            width: 18,
                          ),
                        ),
                        onTap: () => Get.back(),
                      ),
                      addVerticalSpace(Dimensions.heightSize * 1.7),
                      Text(
                        Strings.forgotYourPassword,
                        textAlign: TextAlign.center,
                        style: CustomStyle.defaultTitleStyle,
                      ),
                      addVerticalSpace(Dimensions.heightSize * 2.5),
                      Form(
                        key: forgotPasswordFormKey,
                        child: InputFieldWidget(
                          labelText: Strings.yourEmail,
                          hintText: Strings.enterEmail,
                          borderWidth: 1,
                          keyboardType: TextInputType.emailAddress,
                          controller: controller.emailController,
                        ),
                      ),
                      addVerticalSpace(Dimensions.heightSize * 2.5),
                      PrimaryButtonWidget(
                        text: Strings.findAccount,
                        onPressed: () {
                          Get.toNamed(Routes.otpScreen);
                        },
                      ),
                      addVerticalSpace(Dimensions.heightSize * 1.7),

                      
                      InkWell(
                        child: Text(
                          Strings.loginInstead,
                          style: CustomStyle.defaultSubTitleStyle,
                        ),
                        onTap: (){
                          Get.back();
                        },
                      ),
                      addVerticalSpace(Dimensions.heightSize * 2),
                    ],
                  ),
                );
              },
            )));
  }
}
