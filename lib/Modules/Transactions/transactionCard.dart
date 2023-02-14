import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  // const MenuCard({Key? key}) : super(key: key);
  final String FoodName;
  final String ProviderName;
  final int price;
  final String img_path;

  TransactionCard({
    super.key,
    required this.price,
    required this.img_path, required this.FoodName, required this.ProviderName,
  });

  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      //175 pixels on hieght of 811.2 pixels
      width:screenHeight * 0.216 ,
      //255 pixels on 811.2 px
      height: screenHeight * 0.414,
      padding: EdgeInsets.only(
        bottom: screenHeight * 0.008,
        left: screenHeight * 0.008,
        right: screenHeight * 0.008,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(36),
          color: Colors.black),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            img_path,
            height: screenHeight * 0.14,
            width: screenHeight * 0.14,
          ),
          Text(FoodName,
              style: TextStyle(
                fontSize: screenHeight * 0.03,
                color: Colors.white,
                fontWeight: FontWeight.w600,

              )),
          SizedBox(height: screenHeight * 0.008),
          Text(
            ProviderName,
            style: TextStyle(
              fontSize: screenHeight * 0.010,
              color: Colors.white,
            ),
          ),
          SizedBox(height: screenHeight * 0.009),
          //  PRICE TAG
          Container(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.symmetric(
                horizontal: screenHeight * 0.02),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(36)),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  ),
              child: Row(
                mainAxisSize: MainAxisSize.min,

                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: screenHeight * 0.04),
                    child: Text(
                      '₹' + price.toString(),
                      style: TextStyle(
                          fontSize:
                          screenHeight * 0.0275,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  // SizedBox(
                  //   height: screenHeight * 0.04,
                  // ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(Icons.add),
                  //   padding: EdgeInsets.zero,
                  // ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}