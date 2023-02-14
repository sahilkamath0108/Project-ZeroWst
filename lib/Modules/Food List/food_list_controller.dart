import 'dart:convert';

import 'package:get/get.dart';
import 'package:zerowst_sendnodes/Modules/Auth/auth_controller.dart';
import 'package:http/http.dart' as http;
import 'package:zerowst_sendnodes/Modules/Food%20List/food_model.dart';

AuthController authController = Get.put(AuthController());

class FoodListController extends GetxController {
  String baseUrl = "http://localhost:3000";
  String token = '';
  Future<List<Data>> getFood() async {
    String url = "$baseUrl/";
    if (authController.user == null) {
      token = authController.providerToken!;
      var response = await http.get(Uri.parse("$baseUrl/provider/getFood"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      print(response.body);
      var foodmain = FoodModel.fromJson(jsonDecode(response.body));
      return foodmain.data;
    } else {
      token = authController.userToken!;
      var response = await http.get(Uri.parse("$baseUrl/user/viewFood"),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          });
      print(response.body);
      var foodmain = FoodModel.fromJson(jsonDecode(response.body));
      return foodmain.data;
    }
  }
}
