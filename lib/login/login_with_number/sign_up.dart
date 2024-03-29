import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texi_book/constant/vars.dart';
import 'package:texi_book/login/login_with_number/profile.dart';

import '../../constant/color.dart';
import '../../controller/user_controller.dart';
import '../login.dart';
import 'login_number.dart';

class SignUp extends StatefulWidget {
  final String phoneNumber;

  const SignUp({super.key, required this.phoneNumber});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  UserController userController = Get.find();
  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          fit: StackFit.expand, children: [
        Image.asset("assets/img/login_bg.png",
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
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
                                  builder: (context) => const LoginNumber(),
                                ));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.arrow_back_ios_new),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Center(
                      child: Text(
                    "SIGN UP",
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
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: name,
                          decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              hintText: "Name",
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: hintTextColor),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black))),
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "*required";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: TextFormField(
                            controller: lastName,
                            decoration: InputDecoration(
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                hintText: "Last Name",
                                hintStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: hintTextColor),
                                border: const OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black))),
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "*required";
                              } else {
                                return null;
                              }
                            }),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    enabled: false,
                    controller: TextEditingController(text: widget.phoneNumber),
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w600, color: hintTextColor),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        hintText: "Email",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w600, color: hintTextColor),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter email";
                      } else if (value.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value)) {
                        return "Enter email!";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w600, color: hintTextColor),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return "Enter Password ";
                      } else if (value.length < 6) {
                        return "Password required at least 6 characters";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onChanged: (String value) {
                      if (password.text == confirmPassword.text) {
                        isPasswordMatched = true;
                      } else {
                        isPasswordMatched = false;
                      }
                    },
                    controller: confirmPassword,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Enter confirm password";
                      } else if (!isPasswordMatched) {
                        return "Password not matched";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        hintText: "Confirm Password",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w600, color: hintTextColor),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        hintText: "Referral Code (Optional)",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.w600, color: hintTextColor),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xFF0873ff),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          userController.userDetails = {
                            'first_name': name.text,
                            'last_Name': lastName.text,
                            'email': email.text,
                            'phone_Number': widget.phoneNumber,
                            'password': password.text,
                          } as RxMap;

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Profile(),
                              ));
                        }
                      },
                      child: Container(
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: const Center(
                          child: Text(
                            "SIGN UP",
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
        )
      ]),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            image:
                DecorationImage(image: AssetImage("assets/img/login_bg.png"))),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("You don't hve an account yet?"),
                  Text(
                    "SIGNUP",
                    style: TextStyle(color: Color(0xFF0873ff)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
