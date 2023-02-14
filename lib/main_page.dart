import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zerowst_sendnodes/Modules/Auth/auth_controller.dart';
import 'package:zerowst_sendnodes/Modules/Auth/login_page.dart';
import 'package:zerowst_sendnodes/Modules/Home/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    if(authController.user != null || authController.provider != null) {
      return HomePage();
    }
    else{
      return LoginPage();
    }
  }
}
