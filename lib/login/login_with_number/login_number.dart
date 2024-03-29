import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texi_book/controller/user_controller.dart';

import '../../constant/color.dart';
import '../../constant/vars.dart';
import '../login.dart';
import 'login_otp.dart';

class LoginNumber extends StatefulWidget {
  const LoginNumber({super.key});

  @override
  State<LoginNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<LoginNumber> {
  UserController userController = Get.find();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                                  builder: (context) => const Login(),
                                ));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_back_ios_new),
                          )),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
                  ),
                  const Center(
                      child: Text(
                    "Login Phone",
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
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        // color: Colors.white,
                        border: Border.all(color: Colors.grey)),
                    child: Row(
                      children: [
                        CountryCodePicker(
                          onChanged: (value) {
                            userController.countryCode = value.dialCode!;
                          },
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'IN',
                          favorite: const ['+91', 'IN'],
                          textStyle: const TextStyle(
                              letterSpacing: 1.0,
                              fontSize: 16,
                              color: Colors.black),
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: false,
                        ),
                        Expanded(
                          child: TextField(
                            controller: userController.textPhoneNumber,
                            keyboardType: TextInputType.number,
                            maxLength: 10,
                            style: const TextStyle(letterSpacing: 1.0),
                            decoration: const InputDecoration(
                                counterText: "",
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 8),
                                hintText: "Phone Number",
                                hintStyle:
                                    TextStyle(fontWeight: FontWeight.w600),
                                border: InputBorder.none),
                          ),
                        ),
                      ],
                    ),
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
                        if (userController.isOTPLoading) {
                          return;
                        }
                        userController.isOTPLoading = true;
                        setState(() {});
                        userController.getOTP();
                      },
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Center(
                          child: userController.isOTPLoading
                              ? const SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ))
                              : const Text(
                                  "CONTINUE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w900),
                                ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: yellow,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            ));
                      },
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: const Center(
                          child: Text("LOGIN WITH EMAIL",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
