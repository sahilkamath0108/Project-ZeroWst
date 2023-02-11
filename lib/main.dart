import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zerowst_sendnodes/Modules/Auth/login_page.dart';
import 'package:zerowst_sendnodes/Modules/Home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: GoogleFonts.poppins().fontFamily),
      home: LoginPage(),
    );
  }
}
