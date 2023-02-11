import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:zerowst_sendnodes/Modules/Auth/login_page.dart';
import 'package:zerowst_sendnodes/Modules/Food%20List/food_list_page.dart';
import 'package:zerowst_sendnodes/Modules/Map/map_page.dart';
import 'package:zerowst_sendnodes/Modules/Notices/notices_page.dart';
import 'package:zerowst_sendnodes/Modules/Transactions/previous_transactions_page.dart';
import 'package:zerowst_sendnodes/Modules/Provider%20List/provider_list_page.dart';
import 'package:zerowst_sendnodes/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget? _child;

  @override
  void initState() {
    _child = FoodListPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void _handleNavigationChange(int index) {
      setState(() {
        switch (index) {
          // case 0:
          //   _child = ResList();
          //   break;
          case 0:
            _child = FoodListPage();
            break;
          case 1:
            _child = MapPage();
            break;
          case 2:
            _child = ProviderListPage();
            break;
          case 3:
            _child = PreviousTransactionsPage();
        }
        _child = AnimatedSwitcher(
          switchInCurve: Curves.easeOut,
          switchOutCurve: Curves.easeIn,
          duration: Duration(milliseconds: 500),
          child: _child,
        );
      });
    }

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            leading: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
            elevation: 0,
            backgroundColor: DARK_GREEN,
            title: Text("ZeroWst"),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  icon: Icon(Icons.notifications)),
            ],
          ),
          extendBody: true,
          backgroundColor: Colors.grey[200],
          bottomNavigationBar: FluidNavBar(
              onChange: _handleNavigationChange,
              style: FluidNavBarStyle(
                barBackgroundColor: DARK_GREEN,
                iconUnselectedForegroundColor: Colors.white,
                iconSelectedForegroundColor: Colors.white,
              ),
              animationFactor: 0.4,
              icons: [
                //FluidNavBarIcon(icon: Icons.note_sharp,),
                FluidNavBarIcon(icon: Icons.home),
                FluidNavBarIcon(icon: Icons.map),
                FluidNavBarIcon(icon: Icons.list_alt),
                FluidNavBarIcon(icon: Icons.attach_money_rounded),
              ]),
          body: _child),
    );
  }
}
