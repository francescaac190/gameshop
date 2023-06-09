import 'package:flutter/material.dart';
import 'package:gameshop/routes/routes.dart';
import 'package:gameshop/utils/custom_style.dart';
import 'package:gameshop/utils/dimensions.dart';
import 'package:gameshop/utils/size.dart';
import 'package:gameshop/utils/strings.dart';
import 'package:gameshop/widgets/others/app_logo_widget.dart';
import 'package:get/get.dart';

import '../../../utils/custom_color.dart';
import '../../../widgets/buttons/primary_button_widget.dart';

class WelComeScreen extends StatelessWidget {
  const WelComeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.9),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          _appLogo(context),
          _welcomeTextWidget(context),
          _signInAndSignUpButtonWidget(context),
        ],
      ),
    );
  }

  _appLogo(BuildContext context) {
    return const AppLogoWidget(
      height: 212,
    );
  }

  _welcomeTextWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimensions.heightSize * 5,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: mainCenter,
            children: [
              Text(
                Strings.welcomeTo + Strings.appName,
                style: CustomStyle.defaultTitleStyle,
              ),
            ],
          ),
          Text(
            Strings.singInNow,
            textAlign: TextAlign.center,
            style: CustomStyle.onboardAndWelcomeDesStyle,
          ),
        ],
      ),
    );
  }

  _signInAndSignUpButtonWidget(BuildContext context) {
    return Column(
      children: [
        PrimaryButtonWidget(
          text: Strings.signIn,
          onPressed: () {
            Get.toNamed(Routes.signInScreen);
          },
        ),
        addVerticalSpace(Dimensions.heightSize * 1.7),
        PrimaryButtonWidget(
          text: Strings.signUp,
          textColor: CustomColor.primaryColor,
          backgroundColor: CustomColor.transparent,
          onPressed: () {
              Get.toNamed(Routes.signUpScreen);
          },
        ),
      ],
    );
  }
}
