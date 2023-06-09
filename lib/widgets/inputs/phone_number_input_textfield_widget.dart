import 'package:flutter/material.dart';
import 'package:gameshop/utils/size.dart';
import 'package:gameshop/widgets/picker/country_code_picker_widget.dart';
import '../../utils/custom_color.dart';
import '../../utils/custom_style.dart';
import '../../utils/dimensions.dart';
import '../../utils/strings.dart';

class PhoneNumberInputTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final TextInputType? keyboardType;
  final bool? readOnly;
  final Color? backgroundColor;
  final Color? hintTextColor;
  final int? maxLine;
  final IconData? iconData;

  const PhoneNumberInputTextFieldWidget(
      {Key? key,
      required this.controller,
      required this.hintText,
      this.keyboardType,
      this.readOnly = false,
      this.backgroundColor = CustomColor.transparent,
      this.hintTextColor = CustomColor.inputTextHintColor,
      this.maxLine,
      this.iconData,
      required this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: crossStart,
        children: [
          Text(
            labelText,
            style: CustomStyle.inputFieldLabelTextStyle,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: mainCenter,
              crossAxisAlignment: crossCenter,
              children: [
                const CountryCodePickerWidget(),
                addHorizontalSpace(Dimensions.widthSize * 0.5),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: Dimensions.buttonHeight,
                    child: TextFormField(
                      maxLines: maxLine,
                      readOnly: readOnly!,
                      controller: controller,
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return null;
                        } else {
                          return Strings.pleaseFillOutTheField;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius * 0.7),
                          borderSide: const BorderSide(
                              color: CustomColor.borderColor, width: 1),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: CustomColor.focusedBorderColor,
                          ),
                          borderRadius:
                              BorderRadius.circular(Dimensions.inputTextBorderRadius),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: CustomColor.borderColor,
                          ),
                          borderRadius:
                              BorderRadius.circular(Dimensions.inputTextBorderRadius),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.inputTextBorderRadius),
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: CustomColor.redColor,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.inputTextBorderRadius),
                          borderSide: const BorderSide(
                            width: 1.5,
                            color: CustomColor.redColor,
                          ),
                        ),
                        filled: true,
                        fillColor: backgroundColor,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: Dimensions.defaultPaddingSize * 0.5,
                            vertical: Dimensions.defaultPaddingSize * 0.4),
                        hintStyle: CustomStyle.textFiledHintTextStyle,
                        hintText: hintText,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // _countryCodePicker(BuildContext context) {
  //   return SizedBox(
  //     height: Dimensions.buttonHeight,
  //     // width: 100,
  //     child: TextFormField(
  //       maxLines: maxLine,
  //       readOnly: true,
  //       decoration: InputDecoration(
  //         border: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(Dimensions.radius*0.7),
  //           borderSide:
  //               const BorderSide(color: CustomColor.borderColor, width: 1),
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderSide: const BorderSide(
  //             width: 1.5,
  //             color: CustomColor.borderColor,
  //           ),
  //           borderRadius: BorderRadius.circular(Dimensions.radius*0.7),
  //         ),
  //         prefixIcon: CountryCodePicker(
  //           padding: const EdgeInsets.only(left: 10),
  //           showFlag: false,
  //           showDropDownButton: true,
  //           backgroundColor: CustomColor.transparent,
  //           textStyle: CustomStyle.inputFieldHintTextStyle,
  //            initialSelection: '+1',
  //         ),
  //         contentPadding: EdgeInsets.zero,
  //       ),
  //     ),
  //   );
  // }
}


// Expanded(
//       child: Container(
      
//         alignment: Alignment.center,
//         height: 52,
//         decoration: BoxDecoration(
//           border: Border.all(
//             width: 1.5,
//             color: CustomColor.borderColor,
//           ),
//           borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: CountryCodePicker(
//                 showDropDownButton: true,
//                 padding: EdgeInsets.zero,
//                 showFlag: false,
//                 backgroundColor: CustomColor.transparent,
//                 textStyle: CustomStyle.inputFieldHintTextStyle,
//                 initialSelection: '+1',
//               ),
//             ),
//           ],
//         ),
//       ),
//     );