import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../utils/strings.dart';

class InGameController extends GetxController {
  RxInt selectValue = 1.obs;
  final fbNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final securityCodeController = TextEditingController();
  RxString selectAccount = Strings.fb.obs;

  List<String> accounts = [
    Strings.fb,
    Strings.gmail,
  ];
}
