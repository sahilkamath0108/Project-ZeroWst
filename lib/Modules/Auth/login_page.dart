import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:zerowst_sendnodes/Modules/Auth/signup_page.dart';

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
                                color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "Login Now!",
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Card(
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
                          margin: EdgeInsets.all(20),
                        ),
                        Card(
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
                          margin:
                              EdgeInsets.only(bottom: 20, left: 20, right: 20),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 20, bottom: 20, right: 20),
                            child: InkWell(
                              onTap: () {
                                if (_formKeyLogin.currentState!.validate()) {
                                  // signIn();
                                }
                              },
                              child: SizedBox(
                                width: double.infinity,
                                child: Card(
                                  child: Center(
                                      child: Text(
                                    "Sign In",
                                    style: TextStyle(color: Colors.white),
                                  )),
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
                                    fontSize: 15, color: Colors.white),
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
                                      fontSize: 15, color: Colors.black),
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
