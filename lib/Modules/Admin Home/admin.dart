import 'package:flutter/material.dart';
import 'package:zerowst_sendnodes/Modules/Admin%20Home/admin_drawer.dart';
import 'package:zerowst_sendnodes/constants.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer: AdminDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: DARK_GREEN,
        title: Text("ZeroWst Provider"),
        // leading: Builder(
        //   builder: (context) => IconButton(
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer();
        //       },
        //       icon: Icon(Icons.menu)),
        // ),
      ),
    );
  }
}
