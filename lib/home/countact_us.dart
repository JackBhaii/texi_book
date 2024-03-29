import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texi_book/constant/text.dart';
import 'package:texi_book/home/custom_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/color.dart';

class ContactUS extends StatefulWidget {
  const ContactUS({super.key});

  @override
  State<ContactUS> createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  final GlobalKey<ScaffoldState> drawerkey13 = GlobalKey();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerkey13,
      drawer: const CustomDrawer(),
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: background,
        elevation: 0,
        leading: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            drawerkey13.currentState!.openDrawer();
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Image.asset(
              "assets/img/menu.png",
              height: 10,
              width: 10,
              // alignment: Alignment.topCenter,
            ),
          ),
        ),
        title: const Text(
          "Contact Us",
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w900, fontSize: 16),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(context);
        },
        elevation: 10,
        backgroundColor: blueColor,
        child: const Icon(Icons.phone),
      ),
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(right: 20, top: 10, left: 20, bottom: 10),
            decoration: const BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 2),
                blurRadius: 5,
              )
            ]),
            // height: 180,
            width: double.maxFinite,

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Our Address",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                SizedBox(height: Get.height * 0.01),
                Text(
                  addressText,
                  style: const TextStyle(
                      fontSize: 10, fontWeight: FontWeight.w900),
                ),
                SizedBox(height: Get.height * 0.03),
                const Text(
                  "Email Us",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "teste@teste.com",
                        style: TextStyle(
                            color: subTitleTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        launch('mailto:jackaptel1892@gmail.com?subject=News&body=New%20plugin');
                      },
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: subTitleTextColor,
                        size: 20,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void showBottomSheet(context){
    showModalBottomSheet(



      backgroundColor: Colors.transparent, context: context, builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,

            children: [

              InkWell(
                onTap: () {
                  launch("tel:9723859162");
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),

                  width: double.maxFinite,
                  child: Row(
                    children: [
                      const SizedBox(width: 8),
                      Icon(Icons.call,
                      color: subTitleTextColor,
                        size: 30,
                      ),
                      const SizedBox(width: 25),
                      Text("Call",
                      style: TextStyle(
                        color: blueColor,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                      const SizedBox(width: 5),
                      Text("9723859162",
                          style: TextStyle(
                          color: blueColor,
                          fontWeight: FontWeight.w600
                      ),),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: (){
                 Get.back();
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Center(
                    child: Text("Cancel",
                    style: TextStyle(
                      color: blueColor,
                      fontWeight: FontWeight.w900
                    ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
    },

    );
  }

}
