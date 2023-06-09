import 'package:flutter/widgets.dart';
import 'package:gameshop/utils/custom_color.dart';
import 'package:gameshop/utils/size.dart';

Widget spaceBetTextWidget(text, String text2) {
  return Container(
    margin: const EdgeInsets.only(top: 28),
    child: Row(
      mainAxisAlignment: mainSpaceBet,
      children: [
        Expanded(
          
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: CustomColor.textColor,
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Text(
            text2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w500,
                color: CustomColor.textColor),
          ),
        ),
      ],
    ),
  );
}
