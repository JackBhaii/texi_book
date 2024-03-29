import 'dart:core';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:texi_book/constant/color.dart';
import 'package:texi_book/login/login.dart';

import 'constant/vars.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({super.key});

  @override
  State<OnBoard> createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  final controller = PageController(viewportFraction: 1, keepPage: true);
  Map<String, dynamic> slider1 = {
    "Image": "assets/img/intro_1.png",
    "Title": "Choose Your Locations",
    "SubTitle":
        "Passengers can choose their\n desired location and know\n the time to reach the\n destination and the amount\n they need to pay."
  };
  Map<String, dynamic> slider2 = {
    "Image": "assets/img/intro_2.png",
    "Title": "Request for Ride",
    "SubTitle":
        "Passengers can request for a\n ride easily from anywhere,\n any time with few steps."
  };
  Map<String, dynamic> slider3 = {
    "Image": "assets/img/intro_3.png",
    "Title": "Track Your Ride",
    "SubTitle":
        "Passengers can track their\n ride and the time required\n for a cab to arrive and also\n time to reach the desired\n destination."
  };
  List<Map<String, dynamic>> sliderList = [];

  int currentIndex = 0;
  final box = GetStorage();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sliderList.addAll([slider1, slider2, slider3]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView.builder(
          controller: controller,
          itemCount: sliderList.length,
          onPageChanged: (index) {
            currentIndex = index;
            setState(() {});
          },
          itemBuilder: (context, index) {
            return Column(
              children: [
                const SizedBox(
                  height: 75,
                ),
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Image.asset(sliderList[index]['Image']),
                ),
                Text(
                  sliderList[index]['Title'],
                  style: TextStyle(
                      color: primary,
                      fontWeight: FontWeight.w900,
                      fontSize: 20,
                      letterSpacing: 1.5),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    sliderList[index]['SubTitle'],
                    style: const TextStyle(
                      color: Colors.black45,
                      letterSpacing: 1.2,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            );
          },
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  currentIndex <= 1
                      ? TextButton(
                          onPressed: () {
                            controller.animateToPage(2,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeIn);
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 1.5,
                                color: Color(0xff6F6F6F),
                                fontWeight: FontWeight.w500),
                          ))
                      : TextButton(
                          style: TextButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24)),
                              backgroundColor: const Color(0xff0873FF),
                              elevation: 5,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10)),
                          onPressed: () {
                            box.write("isOnboardCompleted", true);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                          },
                          child: const Text(
                            "Get Started",
                            style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 1.5,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          )),
                  const SizedBox(
                    height: 35,
                  ),
                  SmoothPageIndicator(
                      controller: controller, // PageController
                      count: 3,
                      effect: const WormEffect(
                        dotHeight: 10,
                        dotWidth: 40,
                        type: WormType.thinUnderground,
                      ), // your preferred effect
                      onDotClicked: (index) {}),
                ],
              ),
            ))
      ],
    ));
  }
}
