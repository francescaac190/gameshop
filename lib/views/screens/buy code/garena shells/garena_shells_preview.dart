// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gameshop/routes/routes.dart';
import 'package:gameshop/utils/assets.dart';
import 'package:gameshop/utils/custom_color.dart';
import 'package:gameshop/widgets/buttons/primary_button_widget.dart';
import 'package:gameshop/widgets/others/row_widget.dart';
import 'package:get/get.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/strings.dart';
import '../../../../widgets/others/custom_appbar.dart';

class GarenaShellsPreview extends StatelessWidget {
  GarenaShellsPreview({Key? key}) : super(key: key);
  final data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryBackgroundColor,
      appBar: CustomAppBar(Strings.preview),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
      child: Column(
        children: [
          _paymentReceiptWidget(context),
          _confirmButtonWidget(context),
        ],
      ),
    );
  }

  _confirmButtonWidget(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 5),
      child: PrimaryButtonWidget(
        text: Strings.confirm,
        onPressed: () {
          Get.toNamed(
            Routes.congratulations,
            arguments: [
              StaticAssets.circleSuccess,
              Strings.congratulations,
              Strings.codeBuySuccessfully,
              Routes.dashBoardScreen,
            ],
          );
        },
      ),
    );
  }

  _paymentReceiptWidget(BuildContext context) {
    final total = data[3] + 1;

    return Column(
      children: [
        spaceBetTextWidget(Strings.cardType, data[1]),
        spaceBetTextWidget(Strings.amount, '${data[3].toString()} USD'),
        spaceBetTextWidget(Strings.quantity, data[0].toString()),
        spaceBetTextWidget(Strings.totalAmount, '${data[3].toString()} USD'),
        spaceBetTextWidget(Strings.charge, '1.00 USD'),
        spaceBetTextWidget(Strings.payableAmount, '${total.toString()} USD'),
        spaceBetTextWidget(Strings.paymentMethod, data[2]),
      ],
    );
  }
}
