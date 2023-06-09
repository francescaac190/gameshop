import 'package:flutter/material.dart';
import 'package:gameshop/utils/assets.dart';
import '../../../../utils/custom_color.dart';
import '../../../../utils/dimensions.dart';
import '../../../../utils/size.dart';
import '../../../../widgets/others/svg_icon.dart';

// ignore: must_be_immutable
class PaymentHistoryWidget extends StatelessWidget {
  bool approved = false;
  bool pending = false;
  bool isGameOrder = false;
  String date;
  String amount;
  String title;
  String? accountType;
  String? accountID;
  String? password;
  String? game;
  String? card;
  String? quantity;
  String? code;
  String price;

  PaymentHistoryWidget({Key? key,
    required this.approved,
    required this.pending,
    required this.amount,
    required this.date,
    required this.title,
    this.accountType,
    this.accountID,
    this.password,
    this.game,
    this.card,
    this.quantity,
    this.code,
    required this.price,
    required this.isGameOrder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: crossStart,
      children: [
        Theme(
          data: ThemeData(dividerColor: Colors.transparent),
          child: ExpansionTile(
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SvgIcon(
                asset: StaticAssets.codeOrders,
                height: 50,
                width: 50,
              ),
            ),
            title: Text(
              title,
              style: TextStyle(
                fontSize: Dimensions.mediumTextSize,
                fontWeight: FontWeight.w500,
                color: CustomColor.textColor,
              ),
            ),
            subtitle: Row(
              children: [
                Text(
                  date,
                  style: TextStyle(
                    fontSize: Dimensions.smallestTextSize,
                    fontWeight: FontWeight.w500,
                    color: CustomColor.inputTextHintColor,
                  ),
                ),
                addHorizontalSpace(4),
                _orderStatus()
              ],
            ),
            trailing: Text(
              amount,
              style: TextStyle(
                fontSize: Dimensions.mediumTextSize,
                fontWeight: FontWeight.w600,
                color: CustomColor.primaryColor,
              ),
            ),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                margin: const EdgeInsets.symmetric(vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(Dimensions.radius * 2),
                    bottomRight: Radius.circular(Dimensions.radius * 2),
                  ),
                  color: CustomColor.whiteColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    isGameOrder == true
                        ? Column(
                            children: [
                              spaceBetText('Account Type', accountType ?? ''),
                              divider,
                              spaceBetText('Account ID', accountID ?? ''),
                              divider,
                              spaceBetText('Password', password ?? ''),
                              divider,
                              spaceBetText('Game', game ?? ''),
                              divider,
                              spaceBetText('Price', price),
                              divider,
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 14,
                                  bottom: 14,
                                  left: 17,
                                  right: 17,
                                ),
                                child: Row(
                                  mainAxisAlignment: mainSpaceBet,
                                  children: [
                                    const Text(
                                      'Order Status',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColor.textColor,
                                      ),
                                    ),
                                    _orderStatus()
                                  ],
                                ),
                              )
                            ],
                          )
                        : Column(
                            children: [
                              spaceBetText('Card', card ?? ''),
                              divider,
                              spaceBetText('Quantity', quantity ?? ''),
                              divider,
                              spaceBetText('Price', price),
                              divider,
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 14,
                                  bottom: 14,
                                  left: 17,
                                  right: 17,
                                ),
                                child: Row(
                                  mainAxisAlignment: mainSpaceBet,
                                  children: [
                                    const Text(
                                      'Order Status',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: CustomColor.textColor,
                                      ),
                                    ),
                                    _orderStatus()
                                  ],
                                ),
                              ),
                              approved == true
                                  ? Column(
                                      children: [
                                        divider,
                                        spaceBetText('Code', code??''),
                                      ],
                                    )
                                  : Container()
                            ],
                          ),
                  ],
                ),
              )
            ],
          ),
        ),
        Container(
          height: 1,
          color: CustomColor.borderColor.withOpacity(0.4),
        )
      ],
    );
  }

  final divider =
      Container(height: 1, color: CustomColor.borderColor.withOpacity(0.60));

  _orderStatus() {
    return Container(
      height: 16,
      width: 64,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: approved == true
            ? CustomColor.greenColor
            : pending == true
                ? const Color(0xffF99F0B)
                : CustomColor.redColor,
      ),
      child: Text(
        approved == true
            ? 'Approved'
            : pending == true
                ? 'Pending'
                : 'Reject',
        style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: CustomColor.whiteColor),
      ),
    );
  }
}

Widget spaceBetText(text, text2) {
  return Container(
    margin: const EdgeInsets.only(
      top: 14,
      bottom: 14,
      left: 17,
      right: 17,
    ),
    child: Row(
      mainAxisAlignment: mainSpaceBet,
      children: [
        Text(
          text,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: CustomColor.textColor),
        ),
        Text(
          text2,
          style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: CustomColor.textColor),
        ),
      ],
    ),
  );
}
