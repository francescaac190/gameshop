import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameshop/controller/auth/email_verification_controller.dart';
import 'package:gameshop/utils/assets.dart';
import 'package:gameshop/widgets/others/svg_icon.dart';
import 'package:get/get.dart';
import '../../../routes/routes.dart';
import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';
import '../../../utils/strings.dart';
import '../../../widgets/buttons/primary_button_widget.dart';
import '../../../widgets/others/custom_appbar.dart';
import '../../../widgets/inputs/otp_input_textfield.dart';

class EmailVerificationScreen extends StatelessWidget {
  EmailVerificationScreen({Key? key}) : super(key: key);
  final _controller = Get.put(EmailVerificationController());
  final otpFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryBackgroundColor,
      appBar: CustomAppBar(Strings.emailVerification),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return ListView(
     
      children: [
        _inputWidget(context),
        _titleAndSubtitleWidget(context),
        _continueButtonWidget(context),
      ],
    );
  }

  _titleAndSubtitleWidget(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize,
      ),
      child: Column(
        crossAxisAlignment: crossCenter,
        children: [
          Text(
            Strings.verificationCode,
            textAlign: TextAlign.center,
            style: CustomStyle.defaultTitleStyle,
          ),
          addVerticalSpace(Dimensions.heightSize * 0.7),
          Text(
            Strings.emailVerificationSubtitle,
            textAlign: TextAlign.center,
            style: CustomStyle.onboardAndWelcomeDesStyle,
          ),
        ],
      ),
    );
  }

  _inputWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize,
        vertical: Dimensions.marginSize * 2.1,
      ),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          Row(
            mainAxisAlignment: mainCenter,
            children: [
              SvgIcon(
                asset: StaticAssets.clock,
                height: 20,
                width: 20,
                color: CustomColor.textColor,
              ),
              addHorizontalSpace(5.w),
              const Text(
                '01:00',
                style: TextStyle(
                  color: CustomColor.textColor,
                  fontSize: 15,
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: Dimensions.heightSize * 5,
            ),
            child: OtpInputTextFieldWidget(
              controller: _controller.emailOtpCodeController,
            ),
          ),
        ],
      ),
    );
  }

  _continueButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: Dimensions.marginSize,
        right: Dimensions.marginSize,
        top: Dimensions.marginSize * 2.5,
        bottom: Dimensions.marginSize * 2.5,
      ),
      alignment: Alignment.center,
      child: Column(
        children: [
          PrimaryButtonWidget(
            text: Strings.submit,
            onPressed: () {
              Get.toNamed(Routes.congratulations, arguments: [
                StaticAssets.circleSuccess,
                Strings.congratulations,
                Strings.accountVerifiedSuccessfully,
                              Routes.signInScreen,
              ]);
            },
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.only(
                top: Dimensions.heightSize * 1.7,
                bottom: Dimensions.topHeight,
              ),
              child: Text(
                Strings.resendCode,
                style: CustomStyle.defaultSubTitleStyle,
              ),
            ),
            onTap: () {

              Get.back();
            },
          ),
        ],
      ),
    );
  }
}
