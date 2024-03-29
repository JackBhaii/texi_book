import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texi_book/constant/vars.dart';
import 'package:texi_book/controller/user_controller.dart';

import '../constant/color.dart';
import 'custom_drawer.dart';

class MyWallet extends StatefulWidget {
  const MyWallet({super.key});

  @override
  State<MyWallet> createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
  final GlobalKey<ScaffoldState> drawerkey7 = GlobalKey();

  final _formKey = GlobalKey<FormState>();
  TextEditingController amount = TextEditingController();
  UserController userController = Get.find();

  String paymentType="Paytm";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerkey7,
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          Container(
              height: 200,
              color: Colors.red,
              child: Stack(
                children: [
                  Image.asset(
                    "assets/img/wallet.png",
                    width: double.maxFinite,
                    // height: double.maxFinite,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InkWell(
                            borderRadius: BorderRadius.circular(25),
                            onTap: () {
                              drawerkey7.currentState!.openDrawer();
                            },
                            child: Image.asset(
                              "assets/img/menu.png",
                              color: Colors.white,
                              height: 30,
                              width: 30,
                              // alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                        const Expanded(
                          child: Text(
                            "Total Balance",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "\$ ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            //8595467995
                            Expanded(
                                child: Text(
                                  userController.userDetails['wallet'].toString(),

                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                            InkWell(
                              onTap: () {
                                showBottomSheet(context);
                              },
                              child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      color: Colors.white),
                                  child: const Text(
                                    "TOPUP WALLET",
                                    style: TextStyle(
                                        color: Color(0xff1E40DD),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              )),
          Expanded(child: Image.asset("assets/img/img.png")),
          const Expanded(
              child: Text(
            "Transaction not found",
            style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                color: Colors.black38),
          ))
        ],
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
      // constraints: BoxConstraints(
      //     maxHeight: Get.height*0.70
      // ),
      backgroundColor: Colors.white,
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      width: double.maxFinite,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20))),
                      // height: 300,
                      child: Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Topup Wallet",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 14),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              "Add Topup Amount",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: hintTextColor,
                                  fontWeight: FontWeight.w900),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: amount,
                              decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 15),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hintText: 'Enter Amount',
                                  hintStyle: TextStyle(
                                      fontSize: 12,
                                      color: subTitleTextColor,
                                      fontWeight: FontWeight.w900)),

                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "*required";
                                }
                                return null;

                              },

                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            const Text(
                              "Select Payment Option",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 12),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 2),
                                    blurRadius: 5,
                                  )
                                ],
                                color: Colors.white,
                              ),
                              width: double.maxFinite,
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/img/Paytm.jpg",
                                  height: 50,
                                  width: 70,
                                  fit: BoxFit.contain,
                                ),
                                title: const Text("Paytm"),
                                trailing: Radio(
                                  groupValue: paymentType,
                                  onChanged: (value) {
                                    paymentType='Paytm';
                                    setState(() {

                                    });
                                  },
                                  value: 'Paytm',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 2),
                                    blurRadius: 5,
                                  )
                                ],
                                color: Colors.white,
                              ),
                              width: double.maxFinite,
                              child: ListTile(
                                leading: Image.asset(
                                  "assets/img/GPay.png",
                                  height: 50,
                                  width: 70,
                                  fit: BoxFit.contain,
                                ),
                                title: const Text("Google Pay"),
                                trailing: Radio(
                                  groupValue: paymentType,
                                  onChanged: (value) {
                                    paymentType='GooglePay';
                                    setState(() {

                                    });
                                  },
                                  value: 'GooglePay',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            InkWell(
                              onTap: () async {
                                if (_formKey.currentState!.validate()){};

                                DocumentSnapshot user=await FirebaseFirestore.instance.collection('users').doc(userController.userDetails['id']).get();
                                Map<String,dynamic> userInfo=user.data() as  Map<String,dynamic>;
                                int wallet=0;
                                if(userInfo['wallet']!=null){
                                  wallet=int.parse(userInfo['wallet'].toString());
                                }

                                int totalWallet=wallet+int.parse(amount.text);

                                FirebaseFirestore.instance.collection('users').doc( userController.userDetails['id']).update(
                                    {
                                      'wallet': totalWallet
                                    });


                            Get.back();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xff1E40DD),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: const Center(
                                  child: Text(
                                    "CONTINUE",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            );
          },
        );
      },
    );
  }
}
