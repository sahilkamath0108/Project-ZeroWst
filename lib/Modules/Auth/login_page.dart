import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zerowst_sendnodes/Modules/Admin%20Home/admin.dart';
import 'package:zerowst_sendnodes/Modules/Auth/auth_controller.dart';
import 'package:zerowst_sendnodes/Modules/Auth/signup_page.dart';
import 'package:zerowst_sendnodes/Modules/Home/home_page.dart';
import 'package:zerowst_sendnodes/Modules/Providers%20Home%20Page/provider_home_page.dart';
import 'package:zerowst_sendnodes/Modules/Providers%20Home%20Page/unverified_provider_page.dart';
import 'package:zerowst_sendnodes/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isValidEmail(String input) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(input);
  }

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();
  final _formKeyLogin = GlobalKey<FormState>();

  AuthController authController = Get.put(AuthController());
  List<String> usersList = ["user", "provider", "admin"];
  String selectedUser = "user";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "Assets/login-bg.jpg",
            width: screenWidth,
            height: screenHeight,
            fit: BoxFit.fill,
          ),
          BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                width: screenWidth,
                height: screenHeight,
                decoration:
                    BoxDecoration(color: Colors.grey.shade400.withOpacity(0.1)),
              )),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKeyLogin,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    color: Colors.grey[200],
                    margin: EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30, left: 15),
                          child: Text(
                            "Hello,",
                            style: TextStyle(
                              fontSize: 80,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Login Now!",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              style: TextStyle(color: Colors.black),
                              validator: (text) => isValidEmail(text!)
                                  ? null
                                  : "Enter valid email",
                              decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: InputBorder.none),
                            ),
                          ),
                          margin: EdgeInsets.all(20),
                        ),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 5),
                            child: TextFormField(
                              controller: _passController,
                              obscureText: true,
                              style: TextStyle(color: Colors.black),
                              validator: (text) {
                                if (text == null || text.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.black),
                                  border: InputBorder.none),
                            ),
                          ),
                          margin:
                              EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        ),
                        Center(child: Text("You are a :")),
                        Center(
                          child: DropdownButton(
                            value: selectedUser,
                            items: usersList.map((String div) {
                              return DropdownMenuItem(
                                value: div,
                                child: Text(div),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedUser = newValue!;
                              });
                            },
                          ),
                        ),

                        Padding(
                            padding: const EdgeInsets.only(
                                left: 20, bottom: 20, right: 20),
                            child: InkWell(
                              onTap: () async {
                                if (_formKeyLogin.currentState!.validate()) {
                                  var response = await authController.login(
                                      _emailController.text.trim(),
                                      _passController.text.trim(),
                                      selectedUser);
                                  if (response == "200") {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()));
                                  }
                                  else if(response == "1"){
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ProvidersHome()));
                                  }
                                  else if(response == "2"){
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => UnverifiedProviderPage()));
                                  }
                                  else if(response == "3"){
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AdminHomePage()));
                                  }
                                  else if (response == "400"){
                                    showDialog(
                                        context: context,
                                        builder: (context) => Dialog(
                                              child: Container(
                                                color: Colors.white,
                                                padding: EdgeInsets.all(20),
                                                child: Text("An error ocurred"),
                                              ),
                                            ));
                                  }
                                }
                              },
                              child: SizedBox(
                                width: double.infinity,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Center(
                                        child: Text(
                                      "Sign In",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                  ),
                                  color: Colors.grey[700],
                                ),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, bottom: 20),
                          child: Row(
                            children: [
                              Text(
                                "Don't have an account?  ",
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => SignupPage()));
                                },
                                child: Text(
                                  "Register Now",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Center(
                        //   child: Text("---OR---"),
                        // ),
                        // SizedBox(
                        //   height: 20,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //   children: [
                        //     GestureDetector(
                        //       onTap: () async {
                        //         final provider = Provider.of<GoogleSignInProvider>(context,listen:false);
                        //         provider.GoogleLogin();
                        //         final firebaseUser = FirebaseAuth.instance.currentUser!;
                        //         bool docExists = await checkIfDocExists(firebaseUser.uid);
                        //         print(docExists);
                        //         if(docExists){

                        //         }
                        //         else{
                        //           print(firebaseUser.uid);
                        //           await FirebaseFirestore.instance.collection('Users').doc(firebaseUser.uid).set({
                        //             "First Name": provider.user.displayName,
                        //             "Email":provider.user.email,
                        //           });
                        //         }
                        //       },
                        //       child: NeuBox(
                        //         child: Center(
                        //           child: Image.asset(
                        //             "Assets/images.png",
                        //             width: 30,
                        //             height: 30,
                        //           ),
                        //         ),
                        //         padding: EdgeInsets.all(10),
                        //       ),
                        //     ),
                        //     NeuBox(
                        //       child: Center(
                        //         child: Image.asset(
                        //           "Assets/f-logo.png",
                        //           width: 30,
                        //           height: 30,
                        //         ),
                        //       ),
                        //       padding: EdgeInsets.all(10),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
