import 'package:flutter/material.dart';
import 'package:gameshop/utils/dimensions.dart';
import '../../../widgets/others/app_logo_widget.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppLogoWidget(
        height: Dimensions.heightSize * 18.5,
        width: Dimensions.heightSize * 22.2,
      ),
    );
  }
}
