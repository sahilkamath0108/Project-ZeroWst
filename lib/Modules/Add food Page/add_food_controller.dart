import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:zerowst_sendnodes/Modules/Auth/auth_controller.dart';

AuthController authController = Get.put(AuthController());
class AddFoodController extends GetxController{
  String baseUrl = "http://localhost:3000";
  String token = authController.providerToken!;
  Future<void> postFood(String name, String expiry, int stock)async{
    String url = "$baseUrl/provider/addFood";
    var data = {
      "name": name,
      "expiryDate": expiry,
      "stock": stock,
    };
    try{
      var response = await http.post(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: json.encode(data),
      );
      print(response.body);
    }catch(e){
      print(e);
    }


  }
}