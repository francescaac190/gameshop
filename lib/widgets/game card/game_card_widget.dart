import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gameshop/utils/custom_color.dart';
import 'package:gameshop/utils/dimensions.dart';

class GameCardWidget extends StatelessWidget {
  final String gameImage;
  final String gameName;
  final VoidCallback onTap;

  const GameCardWidget({
    super.key,
    required this.gameImage,
    required this.gameName,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 241,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(gameImage),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
          borderRadius: BorderRadius.circular(Dimensions.radius),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Dimensions.radius),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 0,
              sigmaY: 0,
            ),
            child: Container(
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.symmetric(
                  vertical: 13,
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0xffffffff).withOpacity(0),
                      const Color(0xff000000).withOpacity(0.2),
                      const Color(0xff000000),
                    ],
                  ),
                ),
                child: Text(
                  gameName,
                  style: TextStyle(
                    color: CustomColor.whiteColor,
                    fontSize: Dimensions.defaultTextSize,
                    fontWeight: FontWeight.w500,
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
