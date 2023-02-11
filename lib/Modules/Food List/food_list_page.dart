import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:zerowst_sendnodes/Modules/Food%20List/food_model.dart';
import 'package:zerowst_sendnodes/Modules/Food%20List/food_widget.dart';
import 'package:http/http.dart' as http;

class FoodListPage extends StatefulWidget {
  const FoodListPage({super.key});

  @override
  State<FoodListPage> createState() => _FoodListPageState();
}

class _FoodListPageState extends State<FoodListPage> {
  List<Food> foodList = [
    Food(
      id: "id",
      name: "Rice",
      expiryDate: "Today",
      isVeg: true,
      // latitude: 123.589,
      // longitude: 25.201473,
      pinCode: 400092,
      imgUrl: "Assets/food 1.jpg",
      ProviderName: 'vatsal',
    ),
    Food(
        id: "id1",
        name: "Vegetables",
        expiryDate: "Tomorrow",
        isVeg: true,
        // latitude: 145.27893,
        // longitude: 456.8459,
        pinCode: 400067,
        imgUrl: "Assets/food.jpeg",
        ProviderName: 'Sahil')
  ];

  var data = {
    "username": "Vatsal",
    "fname": "bdjsn",
    "lname": "sdnja",
    "email": "vsshah2003@gmail.com",
    //"number": 289236,
    "password": "bjasc"
  };

  Future<void> sendData() async {
    String url = "http://192.168.0.102:3000/user/new/";
    var bodyToJson = json.encode(data);
    try {
      final uri = Uri.parse(url);
      var response = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json'
        },
        body: json.encode(data),

      );
      print(response.body);
      print(response.body);
      print(response.body);
    } catch (e) {
      print("Error $e");
    }
    // try{
    //   var response = await dio.post(url,data: json.encode(data),options: Options(headers: {
    //     'Content-type': 'application/json'
    //   }));
    //   print(response.data);
    // } catch(e){
    //   print(e);
    // }


  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendData();
  }

  @override
  Widget build(BuildContext context) {
    sendData();
    return Scaffold(
      body: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: foodList.length,
          itemBuilder: (context, index) {
            Food food = foodList[index];
            return FoodWidget(food: food);
          }),
    );
  }
}
