import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zerowst_sendnodes/Modules/Provider%20List/provider_controller.dart';
import 'package:zerowst_sendnodes/Modules/Provider%20List/provider_model.dart';
import 'package:zerowst_sendnodes/Modules/Provider%20List/provider_widget.dart';

class ProviderListPage extends StatefulWidget {
  const ProviderListPage({Key? key}) : super(key: key);

  @override
  State<ProviderListPage> createState() => _ProviderListPageState();
}

class _ProviderListPageState extends State<ProviderListPage> {
  
  List<Provider> providerList = [
    Provider(id: "id", gstin: "gstin", fName: "Sahil", lName: "Kamath", email: "email", password: "password", phoneNumber: "936522", restaurantLatitude: 89.6254, restaurantLongitude: 12.3654, restaurantName: "restaurantName", OTP: 78962, imgUrl: "Assets/rest1.jpeg"),
    Provider(id: "1", gstin: "gstin", fName: "Sukh", lName: "Sagar", email: "example@gmail.com", password: "password", phoneNumber: "963852741", restaurantLatitude: 12.65, restaurantLongitude: 120.8, restaurantName: "restaurantName", OTP: 859, imgUrl: "Assets/rest2.jpeg"),
    Provider(id: "2", gstin: "gstin", fName: "Taj Mahal", lName: "Hotel", email: "taj@gmail.com", password: "password", phoneNumber: "123789654", restaurantLatitude: 114.235, restaurantLongitude: 10.698, restaurantName: "restaurantName", OTP: 145, imgUrl: "Assets/rest2.jpeg"),
  ];
  ProviderListController providerListController = Get.put(ProviderListController());
  @override
  Widget build(BuildContext context) {
    providerListController.getProvidersList();
    return Scaffold(
      body: ListView.builder(
        itemCount: providerList.length,
          itemBuilder: (context, index){
        Provider provider = providerList[index];
        return ProviderWidget(provider: provider);
      }),
    );
  }
}
