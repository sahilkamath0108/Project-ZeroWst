import 'package:flutter/material.dart';
import 'package:zerowst_sendnodes/Modules/Add%20food%20Page/add_food_page.dart';
import 'package:zerowst_sendnodes/Modules/Food%20List/food_list_page.dart';
import 'package:zerowst_sendnodes/Modules/Home/drawer.dart';
import 'package:zerowst_sendnodes/Modules/Providers%20Home%20Page/provider_drawer.dart';
import 'package:zerowst_sendnodes/constants.dart';

class ProvidersHome extends StatefulWidget {
  const ProvidersHome({Key? key}) : super(key: key);

  @override
  State<ProvidersHome> createState() => _ProvidersHomeState();
}

class _ProvidersHomeState extends State<ProvidersHome> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: ProviderDrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: DARK_GREEN,
          title: Text("ZeroWst Provider"),
          leading: Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: Icon(Icons.menu)),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddFoodPage()));
                },
                child: Card(
                  color: LIGHT_GREEN,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("Add Food",style: TextStyle(color: Colors.white),),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodListPage()));
                },
                child: Card(
                  color: LIGHT_GREEN,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text("View Food",style: TextStyle(color: Colors.white),),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
