import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';
import 'custom_drawer.dart';

class TermsOfService extends StatefulWidget {
  const TermsOfService({super.key});

  @override
  State<TermsOfService> createState() => _TermsOfServiceState();
}

class _TermsOfServiceState extends State<TermsOfService> {

  final GlobalKey<ScaffoldState> drawerkey11 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: drawerkey11,
      drawer: const CustomDrawer(),
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: background,
        elevation: 0,
        leading:
        InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            drawerkey11.currentState!.openDrawer();
          },
          child: Container(
            margin: EdgeInsets.all(5),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25)),
            child: Image.asset(
              "assets/img/menu.png",
              height: 10,
              width: 10,
              // alignment: Alignment.topCenter,
            ),
          ),
        ) ,

        title: const Text(
          "Terms of Service",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
              fontSize: 14),
        ),
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal:20),
        child: Column(

          children: [
            SizedBox(
              height: Get.height*0.02,
            ),
            const Text("Terms and Conditions",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold
            ),
            )
          ],
        ),
      ),

    );
  }
}
