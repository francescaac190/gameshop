import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gameshop/utils/custom_color.dart';
import 'package:gameshop/utils/dimensions.dart';
import 'package:gameshop/utils/size.dart';

import '../others/custom_clip_path.dart';

// ignore: must_be_immutable
class SelectRechargeButtonWidget extends StatefulWidget {
  SelectRechargeButtonWidget(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.title,
      required this.price,
      required this.onChanged})
      : super(key: key);
  final int value;
  final int groupValue;
  final String title;
  final String price;
  void Function(int?)? onChanged;

  @override
  State<SelectRechargeButtonWidget> createState() =>
      _SelectRechargeButtonWidgetState();
}

class _SelectRechargeButtonWidgetState
    extends State<SelectRechargeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    final value = widget.value == widget.groupValue;
    return InkWell(
      onTap: () {
        bool selected = widget.value != widget.groupValue;
        if (selected) {
          widget.onChanged!(widget.value);
        }
      },
      child: Stack(
        children: [
          Container(
              alignment: Alignment.center,
              height: Dimensions.buttonHeight,
              padding:
                  EdgeInsets.symmetric(horizontal: Dimensions.marginSize * 0.5),
              width: 175,
              decoration: BoxDecoration(
                border: Border.all(
                    width: 1.5,
                    color: value
                        ? CustomColor.textColor
                        : CustomColor.borderColor),
                borderRadius: BorderRadius.circular(Dimensions.radius * 0.7),
              ),
              child: Row(
                mainAxisAlignment: mainCenter,
                children: [
                  Text(
                    widget.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize:14 ,
                      fontWeight: FontWeight.w400,
                      color: value
                          ? CustomColor.textColor
                          : CustomColor.inputTextHintColor,
                    ),
                  ),
                  Text(
                    '/${widget.price} USD',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: Dimensions.extraSmallestTextSize,
                      fontWeight: FontWeight.w400,
                      color: value
                          ? CustomColor.textColor
                          : CustomColor.inputTextHintColor,
                    ),
                  ),
                ],
              )),
          value
              ? ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(7.r)),
                      color: CustomColor.primaryColor,
                    ),
                    width: 35,
                    height: 30,
                    child: const Icon(
                      Icons.done_rounded,
                      size: 19,
                      color: CustomColor.whiteColor,
                    ),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
