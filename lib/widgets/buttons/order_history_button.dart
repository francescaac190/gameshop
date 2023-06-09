import 'package:flutter/material.dart';
import 'package:gameshop/utils/custom_color.dart';
import 'package:gameshop/utils/dimensions.dart';

// ignore: must_be_immutable
class OrderHistoryButtonWidget extends StatefulWidget {
  OrderHistoryButtonWidget(
      {Key? key,
      required this.value,
      required this.groupValue,
      required this.title,
      required this.onChanged})
      : super(key: key);
  final int value;
  final int groupValue;
  final String title;
  void Function(int?)? onChanged;

  @override
  State<OrderHistoryButtonWidget> createState() =>
      _OrderHistoryButtonWidgetState();
}

class _OrderHistoryButtonWidgetState extends State<OrderHistoryButtonWidget> {
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
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          alignment: Alignment.center,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color:
                  value ? CustomColor.primaryColor : CustomColor.borderColor),
          child: Center(
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: Dimensions.largeTextSize * 0.8,
                  fontWeight: FontWeight.w400,
                  color: CustomColor.whiteColor),
            ),
          )),
    );
  }
}
