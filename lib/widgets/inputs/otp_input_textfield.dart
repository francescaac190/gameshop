import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../utils/custom_color.dart';


class OtpInputTextFieldWidget extends StatelessWidget {
  const OtpInputTextFieldWidget({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;



  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      appContext: context,
      length: 6,
      obscureText: false,
      keyboardType: TextInputType.number,
      textStyle: const TextStyle(color: CustomColor.blackColor),
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(7),
        selectedColor: CustomColor.borderColor,
        activeColor: CustomColor.borderColor,
        inactiveColor: CustomColor.borderColor,
        fieldHeight: 52,
        fieldWidth: 50,
        activeFillColor: CustomColor.transparent,
      ),
      onChanged: (String value) {},
    );
  }
}
