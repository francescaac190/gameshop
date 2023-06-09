import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:gameshop/utils/strings.dart';
import 'package:gameshop/widgets/buttons/custom_dropdown_button.dart';
import 'package:gameshop/widgets/inputs/input_field_widget.dart';
import 'package:get/get.dart';
import '../../controller/payment method/payment_method_controller.dart';

Widget paymentMethodWidget() {
  PaymentMethodController paymentMethodController = Get.put(PaymentMethodController());
  return Obx(() {
    return InputFieldWidget(
      readOnly: true,
      hintText: paymentMethodController.selectMethod.value,
      labelText: Strings.paymentMethod,
      widget: CustomDropDown(
        itemsList: paymentMethodController.paymentMethod,
        selectMethod: paymentMethodController.selectMethod,
      ), 
    );
  });
}
