import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:zerowst_sendnodes/Modules/Home/user_model.dart';

class AuthController extends GetxController {
  String baseUrl = "http://localhost:3000";
  String? userToken;
  User? user;

  Future<String> login(String userEmail, String password, String role) async {
    String url = "$baseUrl/$role/login";
    var response;
    var data = {
      "email": userEmail,
      "password": password,
    };
    try {
      response = await http.post(
        Uri.parse(url),
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 200) {
        print(response.body);
        var responseBody = jsonDecode(response.body);
        var usermain = UserModel.fromJson(responseBody);
        user = usermain.user;
        return "200";
      }
    } catch (e) {
      print(e);
    }
    return "${response.statusCode}";
  }

  Future<void> signUp(String fName, String lName, String email, String password,
      int phone, bool signUpAsProvider, String? aadharNo, String? org) async {
    String url = '';
    signUpAsProvider == true
        ? url = "$baseUrl/provider/new"
        : "$baseUrl/user/new";
    var data;
    signUpAsProvider == true
        ? data = {
            "fname": fName,
            "lname": lName,
            "email": email,
            "password": password,
            "organization": org,
            "aadharCardNo": aadharNo,
            "number": phone,
            "latitude": 12.253,
            "longitude": 10.3689,
          }
        : {
            "fname": fName,
            "lname": lName,
            "email": email,
            "password": password,
            "number": phone,
          };
    try{
      var response = await http.post(
        Uri.parse(url),
        body: json.encode(data),
        headers: {'Content-Type': 'application/json'},
      );
      print(response.body);
    } catch(e){
      print(e);
    }

  }
}
