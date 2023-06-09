import 'dart:async';
import 'package:get/get.dart';
import '../../helpers/prefs_services.dart';
import '../../routes/routes.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    _goToScreen();
  }

  _goToScreen() async {
    Timer(
        const Duration(seconds: 3),
        () => PrefHelper.isCompleted()
            ? Get.offAndToNamed(Routes.welComeScreen)
            : Get.offAndToNamed(Routes.onboardScreen));
  }
}
