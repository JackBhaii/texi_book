import 'package:flutter/material.dart';
import 'package:texi_book/login/forgotpage.dart';
import 'package:texi_book/login/login_with_number/signup_number/signup_phone.dart';

import '../constant/color.dart';
import 'login_with_number/login_number.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double shadow = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          fit: StackFit.expand,
          children: [
        Image.asset("assets/img/login_bg.png",
            height: double.maxFinite,
            width: double.maxFinite,
            fit: BoxFit.cover),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                ),
                const Text(
                  "Login With Email",
                  style: TextStyle(
                      letterSpacing: 0.60,
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
                Container(
                  height: 3,
                  width: 80,
                  margin: const EdgeInsets.only(top: 8),
                  color: const Color(0xffFFC003),
                ),
                const SizedBox(height: 40),
                Container(
                  color: Colors.white,
                  child: const TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        hintText: "Email",
                        hintStyle: TextStyle(fontWeight: FontWeight.w600),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red))),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  color: Colors.white,
                  child: const TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        hintText: "Password",
                        hintStyle: TextStyle(fontWeight: FontWeight.w600),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Card(
                  elevation: shadow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Material(
                    color: const Color(0xFF0873ff),
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTapUp: (val) {
                        Future.delayed(const Duration(milliseconds: 500),(){
                          shadow = 0;
                          setState(() {});
                        });
                      },
                      onTap: () {
                        shadow = 6;
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),

                        ),
                        child: const Center(
                          child: Text("LOG IN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900)),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ForgotPage(),));
                    },
                    child: const Text("Forgot your password?",
                      style: TextStyle(
                          color: Color(0xFF0873ff),
                          fontWeight: FontWeight.w900
                      ),),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Material(
                  color: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginNumber(),));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(color:const Color(0xFF0873ff) ),
                        borderRadius: BorderRadius.circular(8),

                      ),
                      child: const Center(
                        child: Text("LOGIN WITH PHONE NUMBER",
                            style: TextStyle(
                                color: Color(0xFF0873ff),
                                fontWeight: FontWeight.w900)),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),

      ]),
      bottomNavigationBar:
      Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/img/login_bg.png"))
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPhone(),));
            },
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(

                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("You don't hve an account yet?"),
                  Text("SIGNUP",
                    style:TextStyle(
                        color: Color(0xFF0873ff)
                    ) ,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
