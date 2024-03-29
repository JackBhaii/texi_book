import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:texi_book/constant/vars.dart';

import '../../constant/color.dart';
import '../../controller/user_controller.dart';
import '../../home/home_page.dart';

class Profile extends StatefulWidget {

  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  UserController userController = Get.find();
  XFile? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height:50
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
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_ios_new),
                  )),
            ),
          ),
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.08,
            ),
            const Center(
                child: Text(
                  "Select a photo for your profile",
                  style: TextStyle(
                      fontSize: 20,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w900),
                )),
            const SizedBox(
              height: 20,
            ),
            Text(
              "You must bring out your face and shoulders on the picture. in short we must recognize you through the photo",
              style: TextStyle(
                  letterSpacing: 1.2,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 2,
                  color: hintTextColor),
            ),
            const SizedBox(
              height: 70,
            ),
            image != null ? Center(
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(75),
                  child: Image.file(File(image!.path),
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,)),
            ) : const SizedBox.shrink()
          ],
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            borderRadius: BorderRadius.circular(35),
            onTap: () async {
              if (image == null) {
                Fluttertoast.showToast(
                    msg:"Please Choose Image",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.TOP,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.black,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {
                final storageRef = FirebaseStorage.instance.ref();
                final mountainsRef = storageRef.child("mountains.jpg");
                File file = File(image!.path);
                await mountainsRef.putFile(file);
                String profilePath=await mountainsRef.getDownloadURL();
                userController.userDetails['profile']=profilePath;

                GetStorage().write("isLogin", true);
                GetStorage().write("userDetails",userController.userDetails);

                FirebaseFirestore.instance
                    .collection('users')
                    .add(userController.userDetails as Map<String, dynamic>);

                Navigator.push(context, MaterialPageRoute(builder: (context) =>  HomePage(image: image!.path),));

              }
            },
            child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(boxShadow: const [
                  // BoxShadow(
                  //     offset: Offset(0, 0), color: Colors.black12, blurRadius: 15)
                ], color: yellow, borderRadius: BorderRadius.circular(45)),
                child: const Icon(Icons.arrow_forward_ios_rounded)),
          ),
          Container(
            height: 60,
            decoration: const BoxDecoration(color: Colors.white),
            child: InkWell(
              onTap: () async {
                image =
                await ImagePicker().pickImage(source: ImageSource.gallery);
                setState(() {

                });
                // final XFile? photo = await ImagePicker().pickImage(source: ImageSource.camera);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8), color: primary),
                child: const Center(
                  child: Text(
                    "SELECT A PHOTO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
