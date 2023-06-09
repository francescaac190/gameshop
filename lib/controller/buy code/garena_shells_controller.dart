import 'package:get/get.dart';
class GarenaShellsController extends GetxController {
  final count = 0.obs;
  RxInt selectValue = 1.obs;

  increment() => count.value++;
  decrease() {
    if (count.value > 0) {
      count.value--;
    }
  }

  
}
