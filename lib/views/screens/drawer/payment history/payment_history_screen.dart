import 'package:flutter/material.dart';
import 'package:gameshop/data/payment_list.dart';
import 'package:gameshop/utils/assets.dart';
import 'package:gameshop/widgets/others/custom_appbar.dart';

import '../../../../utils/custom_color.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/size.dart';
import '../../../../utils/strings.dart';
import '../../../../widgets/others/svg_icon.dart';

class PaymentHistoryScreen extends StatelessWidget {
  const PaymentHistoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(Strings.paymentHistory),
      backgroundColor: CustomColor.primaryBackgroundColor,
      body: _bodyWidget(context),
    );
  }

  _bodyWidget(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        itemCount: paymentHistoryList.length,
        itemBuilder: (BuildContext context, int index) {
          final history = _paymentHistoryWidget(
            isAddMoney: paymentHistoryList[index].isAddMoney,
            amount: paymentHistoryList[index].amount,
            date: paymentHistoryList[index].date,
          );
          return history;
        },
      ),
    );
  }

  _paymentHistoryWidget(
      {bool isAddMoney = false, required amount, required date}) {
    final historyType = isAddMoney == true;
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: SvgIcon(
              asset: historyType
                  ? StaticAssets.addMoneyHistory
                  : StaticAssets.amountPaidHistory,
              height: 50,
              width: 50,
            ),
            title: Text(
              historyType ? Strings.addMoney : Strings.amountPaid,
              style: TextStyle(
                fontSize: Dimensions.mediumTextSize,
                fontWeight: FontWeight.w500,
                color: CustomColor.textColor,
              ),
            ),
            subtitle: Text(
              date,
              style: TextStyle(
                fontSize: Dimensions.smallestTextSize,
                fontWeight: FontWeight.w500,
                color: CustomColor.inputTextHintColor,
              ),
            ),
            trailing: Text(
              amount,
              style: TextStyle(
                fontSize: Dimensions.mediumTextSize,
                fontWeight: FontWeight.w600,
                color:
                    historyType ? CustomColor.greenColor : CustomColor.redColor,
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          color: CustomColor.borderColor.withOpacity(0.4),
        )
      ],
    );
  }
}
