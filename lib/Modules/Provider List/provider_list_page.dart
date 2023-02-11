import 'package:flutter/material.dart';
import 'package:zerowst_sendnodes/Modules/Provider%20List/provider_model.dart';
import 'package:zerowst_sendnodes/Modules/Provider%20List/provider_widget.dart';

class ProviderListPage extends StatefulWidget {
  const ProviderListPage({Key? key}) : super(key: key);

  @override
  State<ProviderListPage> createState() => _ProviderListPageState();
}

class _ProviderListPageState extends State<ProviderListPage> {
  
  List<Provider> providerList = [
    Provider(id: "id", gstin: "gstin", fName: "Sahil", lName: "Kamath", email: "email", password: "password", phoneNumber: "936522", restaurantLatitude: 89.6254, restaurantLongitude: 12.3654, restaurantName: "restaurantName", OTP: 78962, imgUrl: "Assets/food.jpeg")
  ];
  @override
  Widget build(BuildContext context) {
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
