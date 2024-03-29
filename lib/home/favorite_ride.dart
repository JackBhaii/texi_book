import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/color.dart';
import 'custom_drawer.dart';
import 'home_page.dart';

class FavoriteRide extends StatefulWidget {
  const FavoriteRide({super.key});

  @override
  State<FavoriteRide> createState() => _FavoriteRideState();
}

class _FavoriteRideState extends State<FavoriteRide> {
  final GlobalKey<ScaffoldState> drawerkey3 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerkey3,
      drawer: const CustomDrawer(),
      backgroundColor: couponBgColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: background,
        elevation: 0,
        leading: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            drawerkey3.currentState!.openDrawer();
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
          "Favorite Ride",
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
            const Text("You hve not any favourite ride",
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
                // Get.to(HomePage());
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
