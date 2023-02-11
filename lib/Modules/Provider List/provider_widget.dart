import 'package:flutter/material.dart';
import 'package:zerowst_sendnodes/Modules/Provider%20List/provider_model.dart';
import '../../constants.dart';

class ProviderWidget extends StatelessWidget {
  final Provider provider;
  const ProviderWidget({Key? key, required this.provider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Stack(
        children: [
          Positioned.fill(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(flex: 2, child: Container()),
                Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: MY_GRADIENT,
                      ),
                    )),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Stack(alignment: Alignment.center, children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 110,
                    ),
                    CircleAvatar(
                      backgroundImage: AssetImage(provider.imgUrl),
                      radius: 100,
                    )
                  ]),
                ),
                //SizedBox(height: 15,),
                Text(
                  provider.fName + " " + provider.lName,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 30),
                ),
                Text(
                  provider.phoneNumber,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  provider.restaurantName,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                Text(
                  provider.email,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
