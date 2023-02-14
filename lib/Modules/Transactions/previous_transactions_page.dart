import 'package:flutter/material.dart';
import 'package:zerowst_sendnodes/Modules/Transactions/transactionCard.dart';

class PreviousTransactionsPage extends StatefulWidget {
  const PreviousTransactionsPage({Key? key}) : super(key: key);

  @override
  State<PreviousTransactionsPage> createState() => _PreviousTransactionsPageState();
}

class _PreviousTransactionsPageState extends State<PreviousTransactionsPage> {

  List<String> foodList = ["Rice", "Paneer", "Pav Bhaji"];
  List<String> providerList = ["Sahil Kamath", "Vatsal Shah", "Medha Shah"];
  List<int> pricesList = [800, 2100, 1000];
  List<String> imgUrl = ["Assets/food 1.jpg","Assets/food.jpeg", "Assets/food 2.jpeg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: ((context, index) {
          return TransactionCard(
              FoodName: foodList[index],
              ProviderName: providerList[index],
              price: pricesList[index],
              img_path: imgUrl[index]);
          // return PizzaCardWidget(
          //   name: pizzaData[index].name,
          //   description: pizzaData[index].description,
          //   price: pizzaData[index].price,
          // );
        }),
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 0.8,
            mainAxisSpacing: 4,
            crossAxisSpacing: 6,
            crossAxisCount: 2),
      ),
    );
  }
}
