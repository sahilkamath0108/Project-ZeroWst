import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:zerowst_sendnodes/Modules/Auth/auth_controller.dart';

AuthController authController = Get.put(AuthController());
class ProviderListController extends GetxController {
  String baseUrl = "http://localhost:3000";
  String token = authController.userToken!;
  Future<void> getProvidersList() async {
    String url = "$baseUrl/user/viewProvider";
    try{
      var response = await http.get(Uri.parse(url),headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      });
      print(response.body);
    } catch (e) {
      print(e);
    }

  }
}