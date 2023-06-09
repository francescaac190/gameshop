// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gameshop/controller/order%20history/order_history_controller.dart';
import 'package:gameshop/data/card_order_list.dart';
import 'package:gameshop/data/game_orders_list.dart';
import 'package:gameshop/widgets/buttons/order_history_button.dart';
import 'package:gameshop/widgets/others/custom_appbar.dart';
import 'package:get/get.dart';
import '../../../../utils/custom_color.dart';
import '../../../../utils/size.dart';
import '../../../../utils/strings.dart';
import '../../../../widgets/order history/payment_history_widget.dart';

class OrderHistoryScreen extends StatelessWidget {
  OrderHistoryScreen({Key? key}) : super(key: key);
  OrderHistoryController controller = Get.put(OrderHistoryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.orderHistory),
      backgroundColor: CustomColor.primaryBackgroundColor,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return Obx(() => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _historyButton(context),
            controller.selectValue.value == 1
                ? _gameOrdersWidget(context)
                : _codeOrdersWidget(context)
          ],
        ));
  }

  _historyButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Row(
        children: [
          OrderHistoryButtonWidget(
            title: Strings.gameOrders,
            value: 1,
            groupValue: controller.selectValue.value,
            onChanged: (int? value) {
              controller.selectValue.value = value!;
            },
          ),
          addHorizontalSpace(15),
          OrderHistoryButtonWidget(
            title: Strings.codeOrders,
            value: 2,
            groupValue: controller.selectValue.value,
            onChanged: (int? value) {
              controller.selectValue.value = value!;
            },
          ),
        ],
      ),
    );
  }

  _gameOrdersWidget(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: gameOrderList.length,
        itemBuilder: (BuildContext context, int index) {
          final history = PaymentHistoryWidget(
            title: Strings.garenaShells,
            date: gameOrderList[index].date,
            amount: gameOrderList[index].amount,
            approved: gameOrderList[index].approved,
            pending: gameOrderList[index].pending,
            isGameOrder: true,
            accountType: gameOrderList[index].accountType,
            accountID: gameOrderList[index].accountId,
            password: gameOrderList[index].password,
            game: gameOrderList[index].game,
            price: gameOrderList[index].price,
          );
          return history;
        },
      ),
    );
  }

  _codeOrdersWidget(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        itemCount: codeOrderList.length,
        itemBuilder: (BuildContext context, int index) {
          final history = PaymentHistoryWidget(
            title:codeOrderList[index].title,
            date: codeOrderList[index].date,
            amount: codeOrderList[index].amount,
            approved: codeOrderList[index].approved,
            pending: codeOrderList[index].pending,
            isGameOrder: false,
            card: codeOrderList[index].card,
            quantity: codeOrderList[index].quantity,
            price: codeOrderList[index].price,
            code: codeOrderList[index].code,
          );
          return history;
        },
      ),
    );
  }
}
