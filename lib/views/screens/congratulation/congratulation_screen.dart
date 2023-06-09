import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../utils/custom_color.dart';
import '../../../utils/custom_style.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/size.dart';
import '../../../utils/strings.dart';
import '../../../widgets/buttons/primary_button_widget.dart';

class CongratulationScreen extends StatelessWidget {
  final congratulationList = Get.arguments;

  CongratulationScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryBackgroundColor,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: mainCenter,
      children: [
        _congratulationImg(context),
        _titleWidget(context),
        _okayButtonWidget(context)
      ],
    );
  }

  _congratulationImg(BuildContext context) {
    return SvgPicture.asset(
      congratulationList[0],
      height: 149,
      width: 126,
    );
  }

  _titleWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.marginSize),
      child: Column(
        children: [
          Text(
            congratulationList[1],
            textAlign: TextAlign.center,
            style: CustomStyle.defaultTitleStyle,
          ),
          addVerticalSpace(Dimensions.heightSize*0.9),
          Text(
            congratulationList[2],
            textAlign: TextAlign.center,
            style: CustomStyle.defaultSubTitleStyle,
          ),
        ],
      ),
    );
  }

  _okayButtonWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: Dimensions.marginSize,
        vertical: Dimensions.marginSize * 2.5,
      ),
      alignment: Alignment.centerRight,
      child: PrimaryButtonWidget(
        text: Strings.okay,
        onPressed: () {
          Get.offAllNamed(congratulationList[3]);
        },
      ),
    );
  }
}
