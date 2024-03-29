import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texi_book/constant/vars.dart';

import '../constant/color.dart';
import 'custom_drawer.dart';
import 'home_page.dart';

class AllRides extends StatefulWidget {
  const AllRides({super.key});

  @override
  State<AllRides> createState() => _AllRidesState();
}

class _AllRidesState extends State<AllRides> {

  final GlobalKey<ScaffoldState> drawerkey2 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: drawerkey2,
        drawer: const CustomDrawer(),
        backgroundColor: couponBgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: background,
        elevation: 0,
        leading: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            drawerkey2.currentState!.openDrawer();
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
          "All Ridess",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
              fontSize: 14),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/drawer_bg.png",
              // height: double.maxFinite,
              width: double.maxFinite,
              // fit: BoxFit.cover,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.10,
            ),
            const Text("You have not booked any trip.",
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38

              ),
            ),
            const Text("Please book a cab now",
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black38

              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height*0.03,
            ),
            InkWell(
              onTap: () {
                Get.to(const HomePage());
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color:const Color(0xff012AFF),
                  borderRadius: BorderRadius.circular(10)
                ),

                child: const Center(
                  child: Text("BOOK NOW",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold

                  ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),

    );
  }
}
