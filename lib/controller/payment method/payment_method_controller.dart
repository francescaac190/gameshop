import 'package:get/get.dart';
import '../../utils/strings.dart';
 
class PaymentMethodController extends GetxController {
  RxInt selectValue = 1.obs;
  RxString selectMethod = Strings.paypal.obs;


  List<String> paymentMethod = [
    Strings.paypal,
    Strings.cards,
    Strings.myWallet,
  ];

}
