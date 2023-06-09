import 'package:flutter/material.dart';
import 'package:gameshop/utils/custom_style.dart';
import 'package:gameshop/widgets/others/svg_icon.dart';
import '../../utils/assets.dart';
import '../../utils/custom_color.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

class InputFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final String labelText;
  final Widget? widget;
  final VoidCallback? onTap;
  final double borderWidth;
  final bool isLabelText;
  final bool isLabelIcon;

  const InputFieldWidget({
    Key? key,
    this.controller,
    required this.hintText,
    this.keyboardType,
    this.readOnly = false,
    this.backgroundColor,
    this.hintTextColor,
    required this.labelText,
    this.widget,
    this.onTap,
    this.borderWidth = 1.5,
    this.isLabelText = true,
    this.isLabelIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLabel = isLabelText == true;
    final labelIcon = isLabelIcon == true;
    return Padding(
      padding: EdgeInsets.only(top: isLabel ? 15 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isLabel
              ? Row(
                  children: [
                    Text(
                      labelText,
                      style: CustomStyle.inputFieldLabelTextStyle,
                    ),
                    labelIcon
                        ? SvgIcon(
                            asset: StaticAssets.link, height: 19, width: 19)
                        : Container()
                  ],
                )
              : const Text(''),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: SizedBox(
              height: Dimensions.buttonHeight,
              child: TextFormField(
                onTap: onTap,
                maxLines: 1,
                readOnly: readOnly!,
                controller: controller,
                keyboardType: keyboardType,
                autofocus: false,
                cursorColor: CustomColor.primaryColor,
                style: CustomStyle.inputTextStyle,
                decoration: InputDecoration(
                    hintText: hintText,
                    contentPadding: EdgeInsets.symmetric(
                        horizontal: Dimensions.defaultPaddingSize * 0.6),
                    hintStyle: CustomStyle.textFiledHintTextStyle,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: borderWidth,
                          color: CustomColor.focusedBorderColor),
                      borderRadius: BorderRadius.circular(
                          Dimensions.inputTextBorderRadius),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          width: borderWidth, color: CustomColor.borderColor),
                      borderRadius: BorderRadius.circular(
                          Dimensions.inputTextBorderRadius),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          Dimensions.inputTextBorderRadius),
                      borderSide: BorderSide(
                          width: borderWidth, color: CustomColor.redColor),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          Dimensions.inputTextBorderRadius),
                      borderSide: BorderSide(
                          width: borderWidth, color: CustomColor.redColor),
                    ),
                    suffixIcon: widget == null
                        ? const Text('')
                        : Padding(
                            padding: EdgeInsets.only(
                                right: Dimensions.defaultPaddingSize * 0),
                            child: Container(child: widget),
                          )),
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return null;
                  } else {
                    return Strings.pleaseFillOutTheField;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
