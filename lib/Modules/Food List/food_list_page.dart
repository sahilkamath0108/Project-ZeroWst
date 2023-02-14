import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zerowst_sendnodes/Modules/Food%20List/food_list_controller.dart';
import 'package:zerowst_sendnodes/Modules/Food%20List/food_model.dart';
import 'package:zerowst_sendnodes/Modules/Food%20List/food_widget.dart';
import 'package:http/http.dart' as http;

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List<String> imgUrl = ["Assets/food 1.jpg","Assets/food.jpeg", "Assets/food 2.jpeg"];


  // Future<void> sendData() async {
  //   String url = "http://192.168.0.102:3000/user/new/";
  //   var bodyToJson = json.encode(data);
  //   try {
  //     final uri = Uri.parse(url);
  //     var response = await http.post(
  //       uri,
  //       headers: {
  //         'Content-Type': 'application/json'
  //       },
  //       body: json.encode(data),
  //
  //     );
  //     print(response.body);
  //     print(response.body);
  //     print(response.body);
  //   } catch (e) {
  //     print("Error $e");
  //   }
  //   // try{
  //   //   var response = await dio.post(url,data: json.encode(data),options: Options(headers: {
  //   //     'Content-type': 'application/json'
  //   //   }));
  //   //   print(response.data);
  //   // } catch(e){
  //   //   print(e);
  //   // }
  //
  //
  // }
  FoodListController foodListController = Get.put(FoodListController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foodListController.getFood();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: FutureBuilder(
        future: foodListController.getFood(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                Data food = snapshot.data![index];
                return FoodWidget(food: food, imgUrl: imgUrl[index],);
              });
        }
      ),
    );
  }
}
