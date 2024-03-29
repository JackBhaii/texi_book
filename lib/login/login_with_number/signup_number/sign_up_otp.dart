import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:texi_book/controller/user_controller.dart';
import 'package:texi_book/login/login_with_number/signup_number/signup_phone.dart';

import '../../../home/home_page.dart';
import '../sign_up.dart';

class SignUpOtp extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;
  const SignUpOtp
      ({super.key, required this.verificationId, required this.phoneNumber});

  @override
  State<SignUpOtp> createState() => _SignUpOtpState();
}

class _SignUpOtpState extends State<SignUpOtp> {

  UserController userController = Get.find();


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/img/login_bg.png",
              height: double.maxFinite,
              width: double.maxFinite,
              fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Card(
                    elevation: 8,
                    shape: const CircleBorder(),
                    child: Material(
                      color: Colors.white,
                      shape: const CircleBorder(),
                      child: InkWell(
                          borderRadius: BorderRadius.circular(24),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignupPhone(),
                                ));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_back_ios_new),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.25,
                  ),
                  const Center(
                      child: Text(
                        "Enter OTP",
                        style: TextStyle(
                            letterSpacing: 1.2,
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                      )),
                  Center(
                    child: Container(
                        height: 3,
                        width: 90,
                        margin: const EdgeInsets.only(top: 8),
                        color: const Color(0xffFFC003)),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Pinput(
                    length: 6,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    defaultPinTheme: PinTheme(
                      width: 56,
                      height: 56,
                      textStyle: const TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    autofocus: true,
                    onCompleted: (pin) {
                      userController.otp = pin;
                    },
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF0873ff),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () async {
                       userController.verifySignOTP();
                      },
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: const Center(
                          child: Text(
                            "DONE",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w900),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
