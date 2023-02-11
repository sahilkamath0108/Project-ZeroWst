import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zerowst_sendnodes/Modules/Auth/auth_controller.dart';
import 'package:zerowst_sendnodes/main_page.dart';
import 'user_model.dart';

class DrawerPage extends StatefulWidget {
  final User user;
  const DrawerPage({Key? key, required this.user}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          LogoHeader(),
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Color(0xFFC03839),
              child: Text('NC', style: TextStyle(color: Colors.white)),
            ),
            title: Text(widget.user.fname +" "+ widget.user.lname, style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
            subtitle: Text(widget.user.email),
            onTap: () {},
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Homepage', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
            trailing: ClipOval(
                child: Container(
                    color: Color(0xFFC03839),
                    width: 20,
                    height: 20,
                    child: Center(
                      child: Text(
                        '8',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ))),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // ORANGE BUTTON
          // ListTile(
          //   leading: Icon(Icons.notifications),
          //   title: Text('Notifications'),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(15),
          //   ),
          //   textColor: Colors.white,
          //   iconColor: Colors.white,
          //   tileColor: Color(0xFFC03839),
          //   trailing: ClipOval(
          //       child: Container(
          //           color: Colors.white,
          //           width: 20,
          //           height: 20,
          //           child: Center(
          //             child: Text(
          //               '8',
          //               style: TextStyle(
          //                 color: Color(0xFFC03839),
          //                 fontSize: 12,
          //               ),
          //             ),
          //           ))),
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          //),
          ListTile(
            leading: Icon(Icons.restaurant_menu),
            title: Text('Menu', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
            onTap: () {
              // Navigator.pop(context);
              Navigator.pushNamed(context, '/menu');
            },
          ),
          ListTile(
            leading: Icon(Icons.local_pizza),
            title: Text('Categories', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log Out', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15)),
            onTap: () {
              authController.user = null;
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MainPage()));
            },
          ),
        ],
      ),
    );
  }
}


class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: DrawerHeader(
        margin: EdgeInsets.zero,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15)),
          color: Color(0xFF2f2235),
        ),
        child: Image(
          fit: BoxFit.contain,
          image: NetworkImage('https://www.smokeydough.in/images/logo.png'),
        ),
      ),
    );
  }
}
