import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gameshop/utils/strings.dart';


class DrawerUtils {
  static List items = [
    {
      'title': Strings.addMoney,
      'icon': FontAwesomeIcons.moneyCheckDollar,
      'route': '/addMoneyScreen',
    },
    {
      'title': Strings.paymentHistory,
      'icon': FontAwesomeIcons.clockRotateLeft,
      'route': '/paymentHistoryScreen',
    },
    {
      'title': Strings.orderHistory,
      'icon': FontAwesomeIcons.cartArrowDown,
      'route': '/orderHistoryScreen',
    },
    {
      'title': Strings.privacyAndPolicy,
      'icon': FontAwesomeIcons.shieldHalved,
      'route': '/dashBoardScreen',
    },
  ];
}
