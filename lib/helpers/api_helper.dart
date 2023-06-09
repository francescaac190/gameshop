import 'package:gameshop/helpers/prefs_services.dart';
import 'package:gameshop/utils/api_config.dart';

class ApiHelper {
  static url(String endpoint) {
    return Uri.parse('${ApiConfig.baseUrl}$endpoint');
  }

  static Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer ${PrefHelper.getToken()}'
  };
}
