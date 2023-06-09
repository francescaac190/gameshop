// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gameshop/routes/routes.dart';
import 'package:gameshop/utils/assets.dart';
import 'package:gameshop/utils/dimensions.dart';
import 'package:gameshop/utils/size.dart';
import 'package:gameshop/utils/strings.dart';
import 'package:gameshop/widgets/buttons/select_recharge_button_widget.dart';
import 'package:gameshop/widgets/others/custom_appbar.dart';
import 'package:gameshop/widgets/payment%20method/payment_method_widget.dart';
import 'package:gameshop/widgets/others/svg_icon.dart';
import 'package:get/get.dart';
import '../../../../../utils/custom_color.dart';
import '../../../../../utils/custom_style.dart';
import '../../../../../widgets/buttons/primary_button_widget.dart';
import '../../../../controller/buy code/garena_shells_controller.dart';
import '../../../../controller/payment method/payment_method_controller.dart';

class GarenaShellsScreen extends StatelessWidget {
  GarenaShellsScreen({Key? key}) : super(key: key);
  GarenaShellsController controller = Get.put(GarenaShellsController());
  PaymentMethodController paymentMethodController =
      Get.put(PaymentMethodController());
  final gameTitle = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryBackgroundColor,
      appBar: CustomAppBar(gameTitle[0]),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(() => Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
          child: ListView(
            children: [
              _methodWidget(context),
              _buyNowButtonWidget(context),
            ],
          ),
        ));
  }

  _methodWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        _quantityWidget(context),
        _selectRechargeWidget(context),
        paymentMethodWidget(),
      ],
    );
  }

  _buyNowButtonWidget(BuildContext context) {
    final value = controller.selectValue.value;
    final quantity = controller.count.value;

    final selectCard = value == 1 ? 'Bronze' : 'Silver';
    final amount = value == 1 ? 5.00 : 10.00;
    final selectMethod = paymentMethodController.selectMethod.value;
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 5),
      child: PrimaryButtonWidget(
        text: Strings.buyNow,
        onPressed: () {
          Get.toNamed(
            Routes.garenaShellsPreview,
            arguments: [quantity, selectCard, selectMethod, amount],
          );
        },
      ),
    );
  }

  _selectRechargeWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 10,
          ),
          child: Text(
            Strings.selectCard,
            style: CustomStyle.inputFieldLabelTextStyle,
          ),
        ),
        Row(
          children: [
            Expanded(
              child: SelectRechargeButtonWidget(
                title: Strings.bronze,
                value: 1,
                groupValue: controller.selectValue.value,
                onChanged: (int? value) {
                  controller.selectValue.value = value!;
                }, price: '5.00',
              ),
            ),
            addHorizontalSpace(Dimensions.widthSize),
            Expanded(
              child: SelectRechargeButtonWidget(
                title: Strings.silver,
                value: 2,
                groupValue: controller.selectValue.value,
                onChanged: (int? value) {
                  controller.selectValue.value = value!;
                }, price: '10.00',
              ),
            ),
          ],
        ),
      ],
    );
  }

  _quantityWidget(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 10,
          ),
          child: Text(
            Strings.quantity,
            style: CustomStyle.inputFieldLabelTextStyle,
          ),
        ),
        Row(
          children: [
            InkWell(
              child: SvgIcon(
                asset: StaticAssets.quantityMinus,
                height: 52,
                width: 90,
              ),
              onTap: () {
                controller.decrease();
              },
            ),
            Container(
              height: Dimensions.buttonHeight,
              width: 137,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                border: Border(
                  bottom:
                      BorderSide(width: 1.5, color: CustomColor.borderColor),
                  top: BorderSide(width: 1.5, color: CustomColor.borderColor),
                ),
              ),
              child: Text(
                '${controller.count.value}',
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color: CustomColor.borderColor,
                ),
              ),
            ),
            InkWell(
              child: SvgIcon(
                asset: StaticAssets.quantityPlus,
                height: 52,
                width: 90,
              ),
              onTap: () {
                controller.increment();
              },
            ),
          ],
        )
      ],
    );
  }
}
