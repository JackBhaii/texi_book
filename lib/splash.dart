import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:texi_book/onboard.dart';

import 'constant/vars.dart';
import 'controller/user_controller.dart';
import 'home/home_page.dart';
import 'login/login.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final box = GetStorage();
  UserController userController = Get.find();

  @override
  void initState() {
    super.initState();
    isOnboardCompleted = box.read("isOnboardCompleted") ?? false;
    Future.delayed(
      const Duration(seconds: 2),
      () {
        if (isOnboardCompleted == true) {
          bool isLogin = box.read("isLogin") ?? false;

          if (isLogin == true) {
            if(box.read("userDetails")!=null){
              userController.userDetails=box.read("userDetails");
            }
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ));
          } else {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ));
          }
        } else {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const OnBoard(),
              ));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFCA0E),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(100.0),
        child: Image.asset("assets/img/app_icon.png"),
      )),
    );
  }
}
