import 'package:flutter/material.dart';
import 'package:gameshop/routes/routes.dart';
import 'package:gameshop/utils/assets.dart';
import 'package:gameshop/utils/custom_style.dart';
import 'package:gameshop/utils/dimensions.dart';
import 'package:gameshop/utils/size.dart';
import 'package:gameshop/utils/strings.dart';
import 'package:get/get.dart';

import '../../../helpers/prefs_services.dart';
import '../../../widgets/buttons/primary_button_widget.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize * 0.7),
      child: Column(
        mainAxisAlignment: mainCenter,
        children: [
          _imageWidget(context),
          _onBoardTitleWidget(context),
          _onBoardDesWidget(context),
          _letsGoButtonWidget(context),
        ],
      ),
    );
  }

  _imageWidget(BuildContext context) {
    return Image.asset(
      StaticAssets.onBoarding,
      height: 291,
    );
  }

  _onBoardTitleWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Dimensions.defaultPaddingSize * 0.5,
      ),
      child: Text(
        Strings.onBoardTitle,
        style: CustomStyle.onboardTitleStyle,
      ),
    );
  }

  _onBoardDesWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: Dimensions.defaultPaddingSize * 0.1),
      child: Text(
        Strings.onBoardDes,
        textAlign: TextAlign.center,
        style: CustomStyle.onboardAndWelcomeDesStyle,
      ),
    );
  }

  _letsGoButtonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 5),
      child: PrimaryButtonWidget(
        text: Strings.letsGo,
        onPressed: () {
          PrefHelper.saveIntroStatus(isCompleted: true);
          Get.toNamed(Routes.welComeScreen);
        },
      ),
    );
  }
}
