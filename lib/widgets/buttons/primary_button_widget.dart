import 'package:flutter/material.dart';
import 'package:gameshop/utils/custom_color.dart';

import '../../utils/dimensions.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final double radius;

  const PrimaryButtonWidget({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = CustomColor.primaryColor,
    this.borderColor = CustomColor.primaryColor,
    this.textColor = CustomColor.whiteColor,  this.radius=7,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.buttonHeight,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          elevation: 0,
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
            side: BorderSide(
              width: 2,
              color: borderColor,
            ),
          ),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: Dimensions.buttonTextSize,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
