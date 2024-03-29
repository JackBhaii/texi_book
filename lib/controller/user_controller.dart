import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../home/home_page.dart';
import '../login/login_with_number/login_otp.dart';
import '../login/login_with_number/sign_up.dart';

class UserController extends GetxController{
  bool isOTPLoading = false;
  TextEditingController textPhoneNumber = TextEditingController();
  String countryCode = "+91";
  String verificationId = "";
  String otp="";
  RxMap userDetails ={}.obs;

  getOTP() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '$countryCode${textPhoneNumber.text}',
      verificationCompleted:
          (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        isOTPLoading = false;
      },
      codeSent: (String verifyId, int? resendToken) {
        verificationId = verifyId;
        isOTPLoading = false;
        Get.to(const LoginOtp());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }



  Future<void> verifyLoginOTP( ) async {
    try {
      var credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: otp);
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        QuerySnapshot<Map<String, dynamic>> result =
        await FirebaseFirestore.instance
            .collection('users')
            .where("phone_Number",
            isEqualTo: textPhoneNumber.text)
            .get();

        if (result.docs.isEmpty) {
          Get.to( SignUp(phoneNumber: textPhoneNumber.text));
        } else {
          GetStorage().write("isLogin", true);
          userDetails=result.docs[0].data() as RxMap;
          userDetails['id']=result.docs[0].id;
          GetStorage().write("userDetails", userDetails);
          Get.to(const HomePage());
        }
      }).onError((error, stackTrace) {
        Fluttertoast.showToast(
            msg: "InVaild OTP",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: "InVaild OTP",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  Future<void> verifySignOTP() async {
    try {
      var credential = PhoneAuthProvider.credential(
          verificationId:verificationId,
          smsCode: otp);
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        QuerySnapshot<Map<String, dynamic>> result =
        await FirebaseFirestore.instance
            .collection('users')
            .where("phone_Number",
            isEqualTo: textPhoneNumber.text)
            .get();

        if (result.docs.isEmpty) {

          Get.to(SignUp(phoneNumber: textPhoneNumber.text));
        } else {
          GetStorage().write("isLogin", true);
          userDetails=result.docs[0].data() as RxMap;
          userDetails['id']=result.docs[0].id;
          GetStorage().write("userDetails", userDetails);
          Get.to(const HomePage());

        }
      }).onError((error, stackTrace) {
        Fluttertoast.showToast(
            msg: "InVaild OTP",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 16.0);
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: "InVaild OTP",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }




}
