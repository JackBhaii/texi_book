import 'package:flutter/material.dart';

import 'login.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({super.key});

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
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Login(),));
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
                  "Forgot Password",
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
                  height: 30,
                ),
                const Text(
                  "Enter the email address we will send an OPT to create new password.",
                  style: TextStyle(
                      color: Color(0xff666666),
                      letterSpacing: 1,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  color: Colors.white,
                  child: const TextField(
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 8),
                        hintText: "Email",
                        hintStyle: TextStyle(fontWeight: FontWeight.w600),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black))),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Material(
                  borderRadius: BorderRadius.circular(10),
                  color: const Color(0xFF0873ff),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {},
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      child: const Center(
                        child: Text(
                          "SEND",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w900),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
