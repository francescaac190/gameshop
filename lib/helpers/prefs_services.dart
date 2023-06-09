//========== Set Local Storage String Value ============
import 'package:get_storage/get_storage.dart';

class PrefHelper {
  static void saveIntroStatus({required bool isCompleted}) {
    GetStorage().write("isCompleted", isCompleted);
  }

  static bool isCompleted() {
    return GetStorage().read("isCompleted") ?? false;
  }

  static Future<void> saveUserToken(
      {required String token, required bool isLoggedIn}) async {
    final box = GetStorage();
    await box.write("token", token);
    await box.write("isLoggedIn", isLoggedIn);
  }

  static bool isLoggedIn() {
    return GetStorage().read("isLoggedIn") ?? false;
  }

  static String getToken() {
    return GetStorage().read("token");
  }

  static Future<void> logout() async {
    final box = GetStorage();
    await box.remove("token");
    await box.remove("isLoggedIn");
  }

  static Future<void> saveReferToken({required String token}) async {
    final box = GetStorage();
    await box.write("referToken", token);
  }

  static String getReferToken() {
    return GetStorage().read("referToken");
  }
}
