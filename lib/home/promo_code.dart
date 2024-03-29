import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../constant/color.dart';
import 'custom_drawer.dart';

class PromoCode extends StatefulWidget {
  const PromoCode({super.key});

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  final GlobalKey<ScaffoldState> drawerkey6 = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerkey6,
      drawer: const CustomDrawer(),
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: background,
        elevation: 0,
        leading: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            drawerkey6.currentState!.openDrawer();
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
          "Promo Code",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              // letterSpacing: 1,
              fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 100,
              width: double.maxFinite,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 30),
                    child: CircleAvatar(
                      maxRadius: 25,
                      backgroundColor: Colors.blue,
                      child: Image.asset(
                        "assets/img/promo_code.png",
                        height: 25,
                      ),
                    ),
                  ),
                  Container(
                    width: 1,
                    color: Colors.grey.shade300,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("10 % off",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        Row(
                          // mainAxisSize: MainAxisSize.min,
                          children: [
                            DottedBorder(
                              color: Colors.grey,
                              strokeWidth: 1,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: const Text(
                                "ZEGO10",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1),
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Flexible(
                              child: Text(
                                "Vaild till 13 June 2024 12:00 AM",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
