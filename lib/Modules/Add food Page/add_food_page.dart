import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zerowst_sendnodes/Modules/Add%20food%20Page/add_food_controller.dart';
import 'package:zerowst_sendnodes/constants.dart';

class AddFoodPage extends StatefulWidget {
  const AddFoodPage({Key? key}) : super(key: key);

  @override
  State<AddFoodPage> createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController stockController = TextEditingController();
  File? image;
  AddFoodController addFoodController = Get.put(AddFoodController());

  Future clickImage({required ImageSource imageSource}) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image == null) return;
      final imgTemp = File(image.path);
      setState(() {
        this.image = imgTemp;
      });
    } catch (e) {
      print("Failed to click image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: DARK_GREEN,
          title: Text("Post Food"),
        ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                margin: EdgeInsets.all(30),
                color: LIGHT_GREEN,
                child: image != null
                    ? Image.file(
                  image!,
                  fit: BoxFit.cover,
                )
                    : Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Card(
                          child: IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: () =>
                                clickImage(imageSource: ImageSource.camera),
                          )),
                      Card(
                          child: IconButton(
                            icon: Icon(Icons.photo_library_outlined),
                            onPressed: () =>
                                clickImage(imageSource: ImageSource.gallery),
                          )),
                    ],
                  ),
                )),
          ),

          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 5),
              child: TextFormField(
                controller: nameController,
                style: TextStyle(color: Colors.black),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Name cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Name",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
            ),
            margin:
            EdgeInsets.only(bottom: 20, left: 20, right: 20),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 5),
              child: TextFormField(
                controller: expiryDateController,
                style: TextStyle(color: Colors.black),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Expiry Date cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Expiry",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
            ),
            margin:
            EdgeInsets.only(bottom: 20, left: 20, right: 20),
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 5),
              child: TextFormField(
                controller: stockController,
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return 'Stock cannot be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    hintText: "Stock",
                    hintStyle: TextStyle(color: Colors.black),
                    border: InputBorder.none),
              ),
            ),
            margin:
            EdgeInsets.only(bottom: 20, left: 20, right: 20),
          ),
          GestureDetector(
            onTap: (){
              addFoodController.postFood(nameController.text, expiryDateController.text, int.parse(stockController.text));
            },
            child: SizedBox(
              width: double.infinity,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child: Text(
                        "Post",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
                color: Colors.grey[700],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
