// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gameshop/routes/routes.dart';
import 'package:gameshop/utils/custom_color.dart';
import 'package:gameshop/utils/dimensions.dart';
import 'package:gameshop/utils/size.dart';
import 'package:gameshop/utils/strings.dart';
import 'package:gameshop/widgets/buttons/select_recharge_button_widget.dart';
import 'package:gameshop/widgets/others/custom_appbar.dart';
import 'package:gameshop/widgets/inputs/input_field_widget.dart';
import 'package:gameshop/widgets/payment%20method/payment_method_widget.dart';
import 'package:get/get.dart';
import '../../../../controller/buy code/free_fire_incode_controller.dart';
import '../../../../controller/payment method/payment_method_controller.dart';
import '../../../../utils/custom_style.dart';
import '../../../../widgets/buttons/primary_button_widget.dart';
import '../../../../widgets/toast/toast_message.dart';

class FreeFireIncodeScreen extends StatelessWidget {
  FreeFireIncodeScreen({Key? key}) : super(key: key);
  FreeFireIncodeController controller = Get.put(FreeFireIncodeController());
  final formKey = GlobalKey<FormState>();
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
              _inputWidget(context),
              _buyNowButtonWidget(context),
            ],
          ),
        ));
  }

  _inputWidget(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          InputFieldWidget(
            controller: controller.playerIDController,
            hintText: Strings.playerID,
            labelText: Strings.enterPlayerID,
            keyboardType: TextInputType.number,
          ),
          _selectRechargeWidget(context),
          paymentMethodWidget()
        ],
      ),
    );
  }

  _buyNowButtonWidget(BuildContext context) {
    final value = controller.selectValue.value;
   
    final selectRecharge = value == 1
        ? 'Bronze'
        : value == 2
            ? 'Silver'
            : value == 3
                ? 'Gold'
                : 'Platinum';
    final amount = value == 1
        ? 5.00
        : value == 2
            ? 10.00
            : value == 3
                ? 15.00
                : 25.00;
    final selectMethod = paymentMethodController.selectMethod.value;
    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 5),
      child: PrimaryButtonWidget(
        text: Strings.buyNow,
        onPressed: () {
          controller.playerIDController.text.isNotEmpty?
           Get.toNamed(
                  Routes.freeFireInCodePreview,
                  arguments: [controller.playerIDController.text, selectRecharge, selectMethod, amount],
                ): ToastMessage.error(Strings.pleaseFillOutTheField);
              
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
            Strings.selectRecharge,
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
                },
                price: '5.00',
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
                },
                price: '10.00',
              ),
            ),
          ],
        ),
        addVerticalSpace(10),
        Row(
          children: [
            Expanded(
              child: SelectRechargeButtonWidget(
                title: Strings.gold,
                value: 3,
                groupValue: controller.selectValue.value,
                onChanged: (int? value) {
                  controller.selectValue.value = value!;
                },
                price: '15.00',
              ),
            ),
            addHorizontalSpace(Dimensions.widthSize),
            Expanded(
              child: SelectRechargeButtonWidget(
                title: Strings.platinum,
                value: 4,
                groupValue: controller.selectValue.value,
                onChanged: (int? value) {
                  controller.selectValue.value = value!;
                },
                price: '25.00',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
