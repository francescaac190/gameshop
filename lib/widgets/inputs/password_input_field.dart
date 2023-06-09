// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';

class PasswordInputField extends StatefulWidget {
  TextEditingController controller;
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

  PasswordInputField({
    Key? key,
    required this.controller,
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
  }) : super(key: key);

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isVisibility = true;

  @override
  Widget build(BuildContext context) {
    final isLabel = widget.isLabelText == true;

    return Padding(
      padding: EdgeInsets.only(top: isLabel ? 15 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          isLabel
              ? Text(
                  widget.labelText,
                  style: CustomStyle.inputFieldLabelTextStyle,
                )
              : const Text(''),
          Padding(
              padding: const EdgeInsets.only(top: 5),
              child: SizedBox(
                height: Dimensions.buttonHeight,
                child: TextFormField(
                  onTap: widget.onTap,
                  maxLines: 1,
                  readOnly: widget.readOnly!,
                  controller: widget.controller,
                  keyboardType: TextInputType.visiblePassword,
                  autofocus: false,
                  obscureText: isVisibility,
                  cursorColor: CustomColor.primaryColor,
                  style: CustomStyle.inputTextStyle,
                  decoration: InputDecoration(
                      hintText: widget.hintText,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: Dimensions.defaultPaddingSize * 0.6),
                      hintStyle: CustomStyle.textFiledHintTextStyle,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: widget.borderWidth,
                          color: CustomColor.focusedBorderColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(Dimensions.inputTextBorderRadius),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: widget.borderWidth,
                          color: CustomColor.borderColor,
                        ),
                        borderRadius:
                            BorderRadius.circular(Dimensions.inputTextBorderRadius),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.inputTextBorderRadius),
                        borderSide: BorderSide(
                          width: widget.borderWidth,
                          color: CustomColor.redColor,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.inputTextBorderRadius),
                        borderSide: BorderSide(
                          width: widget.borderWidth,
                          color: CustomColor.redColor,
                        ),
                      ),
                      suffixIcon:  GestureDetector(
                              child: Icon(
                                isVisibility
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: CustomColor.textColor,
                              ),
                              onTap: () {
                                setState(() {
                                  isVisibility = !isVisibility;
                                });
                              },
                            )
                         ),
                ),
              )),
        ],
      ),
    );
  }
}
