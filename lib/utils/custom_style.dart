import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameshop/utils/custom_color.dart';
import 'dimensions.dart';

class CustomStyle {
  static var onboardTitleStyle = TextStyle(
    color: CustomColor.onboardTitleColor,
    fontSize: Dimensions.extraLargeTextSize + 2.sp,
    fontWeight: FontWeight.w600,
  );

  static var defaultTitleStyle = TextStyle(
    color: CustomColor.onboardTitleColor,
    fontSize: Dimensions.extraLargeTextSize - 3.sp,
    fontWeight: FontWeight.w600,
  );

  static var onboardDesStyle = TextStyle(
    color: CustomColor.onboardSubTitleColor,
    fontSize: Dimensions.smallTextSize,
    fontWeight: FontWeight.w500,
  );

  static var onboardAndWelcomeDesStyle = TextStyle(
    color: CustomColor.onboardSubTitleColor,
    fontSize: Dimensions.smallTextSize,
    fontWeight: FontWeight.w500,
  );

  static var inputFieldLabelTextStyle = TextStyle(
    fontSize: Dimensions.largeTextSize * 0.9,
    fontWeight: FontWeight.w600,
    color: CustomColor.textColor,
  );
  static var inputFieldHintTextStyle = TextStyle(
    fontSize: Dimensions.largeTextSize * 0.9,
    fontWeight: FontWeight.w400,
    color: CustomColor.inputTextHintColor,
  );
  static var inputTextStyle = TextStyle(
    fontSize: Dimensions.mediumTextSize,
    fontWeight: FontWeight.w500,
    color: CustomColor.textColor,
  );
  static var textFiledHintTextStyle = TextStyle(
    fontSize: Dimensions.defaultTextSize,
    fontWeight: FontWeight.w400,
    color: CustomColor.inputTextHintColor,
  );
  static var forgotPasswordStyle = TextStyle(
    fontSize: Dimensions.smallTextSize,
    fontWeight: FontWeight.w500,
    color: CustomColor.primaryColor,
  );
  static var defaultSubTitleStyle = TextStyle(
    fontSize: Dimensions.smallTextSize,
    fontWeight: FontWeight.w500,
    color: CustomColor.secondaryColor,
  );
  static var policyOrUserAgreementTextStyle = TextStyle(
    fontSize: Dimensions.smallTextSize,
    fontWeight: FontWeight.w500,
    color: CustomColor.primaryColor,
  );
}
