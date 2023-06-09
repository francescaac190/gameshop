// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:gameshop/routes/routes.dart';
import 'package:gameshop/utils/custom_color.dart';
import 'package:gameshop/utils/dimensions.dart';
import 'package:gameshop/utils/strings.dart';
import 'package:gameshop/widgets/buttons/custom_dropdown_button.dart';
import 'package:gameshop/widgets/others/custom_appbar.dart';
import 'package:gameshop/widgets/inputs/input_field_widget.dart';
import 'package:gameshop/widgets/toast/toast_message.dart';
import 'package:get/get.dart';
import '../../../../controller/others/add_money_controller.dart';
import '../../../../controller/payment method/payment_method_controller.dart';
import '../../../../widgets/buttons/primary_button_widget.dart';

class AddMoneyScreen extends StatelessWidget {
  AddMoneyScreen({Key? key}) : super(key: key);
  AddMoneyController controller = Get.put(AddMoneyController());
  PaymentMethodController paymentMethodController =
      Get.put(PaymentMethodController());
  final gameTitle = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.primaryBackgroundColor,
      appBar: CustomAppBar(Strings.addMoney),
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(() => Container(
          margin: EdgeInsets.symmetric(horizontal: Dimensions.marginSize),
          child: ListView(
            children: [
              _inputWidget(context),
              _confirmNowButtonWidget(context),
            ],
          ),
        ));
  }

  _inputWidget(BuildContext context) {
    return Form(
      child: Column(
        children: [
          InputFieldWidget(
            controller: controller.amountController,
            hintText: '0.00  USD',
            labelText: Strings.amount,
            keyboardType: TextInputType.number,
          ),
          InputFieldWidget(
            readOnly: true,
            hintText: paymentMethodController.selectMethod.value,
            labelText: Strings.paymentMethod,
            widget: CustomDropDown(
              itemsList: paymentMethodController.paymentMethod,
              selectMethod: paymentMethodController.selectMethod,
            ),
          ),
        ],
      ),
    );
  }

  _confirmNowButtonWidget(BuildContext context) {
    final selectMethod = paymentMethodController.selectMethod.value;

    return Container(
      margin: EdgeInsets.symmetric(vertical: Dimensions.heightSize * 5),
      child: PrimaryButtonWidget(
        text: Strings.confirm,
        onPressed: () {
          controller.amountController.text.isNotEmpty
              ? Get.toNamed(
                  Routes.addMoneyPreview,
                  arguments: [selectMethod, controller.amountController.text],
                )
              : ToastMessage.error(Strings.pleaseFillOutTheField);
        },
      ),
    );
  }
}
