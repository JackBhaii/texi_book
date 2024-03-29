import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';
import 'custom_drawer.dart';

class PrivacyPolicy extends StatefulWidget {
  const PrivacyPolicy({super.key});

  @override
  State<PrivacyPolicy> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicy> {

  final GlobalKey<ScaffoldState> drawerkey12 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerkey12,
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
            drawerkey12.currentState!.openDrawer();
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
          "Privacy Policy",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 16),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Column(

          children: [
            SizedBox(
              height: Get.height*0.02,
            ),
            const Text("Privacy Policy",
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}
