import 'package:flutter/material.dart';
import 'package:zerowst_sendnodes/Modules/Food%20List/food_model.dart';
import 'package:zerowst_sendnodes/constants.dart';

class FoodWidget extends StatelessWidget {
  final Food food;
  FoodWidget({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.all(15),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 7,
              color: Color(0x2F1D2429),
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 12),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(0),
                  bottomRight: Radius.circular(0),
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: Image.asset(food.imgUrl,width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,)
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(food.name,
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: DARK_GREEN)),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 4),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Expiry: ${food.expiryDate}",
                        style:
                        TextStyle(color: Color(0xFF39D2C0), fontSize: 14)),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Text(
                        "PINCODE: ${food.pinCode}",
                        style:
                        TextStyle(color: Color(0xFF57636C), fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              // Divider(indent: 30,endIndent: 30,),
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 8),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     children: [
              //       Expanded(
              //         child: Text(
              //           'Team: ${project.core.map((e) => e.Fname)}',
              //           style:
              //           TextStyle(color: Color(0xFF57636C), fontSize: 14),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 4),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       IconButton(icon: Icon(Icons.download_rounded), onPressed: (){},),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
