// ignore_for_file: use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:gameshop/utils/assets.dart';


class AppLogoWidget extends StatelessWidget {
 final double height;
 final double width;
  const AppLogoWidget({
    this.height = 200,
    this.width = 280,
  });
  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
          height: height,
          width: width,
          child: Image.asset(StaticAssets.logo),
        ),
      
    );
  }
}
