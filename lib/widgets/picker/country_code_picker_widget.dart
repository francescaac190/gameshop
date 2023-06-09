import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:gameshop/utils/custom_color.dart';
import 'package:gameshop/utils/custom_style.dart';
import 'package:gameshop/utils/dimensions.dart';

class CountryCodePickerWidget extends StatelessWidget {
  const CountryCodePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimensions.inputTextBorderRadius),
        border: Border.all( color: CustomColor.borderColor, width: 1.5)
      ),
      child: CountryCodePicker(
        padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0, top: 0),
        showFlag: false,
        // alignLeft: true,
        favorite: const [
          '+880'
        ],

        showDropDownButton: true,
        backgroundColor: CustomColor.transparent,
        textStyle: CustomStyle.inputFieldHintTextStyle,
        initialSelection: '+880',
      ),
    );
  }
}
