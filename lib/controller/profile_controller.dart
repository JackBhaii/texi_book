 import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constant/vars.dart';

class ProfileController  extends GetxController{

  final ImagePicker picker = ImagePicker();
  XFile? image;
  TextEditingController currentPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();


  final GlobalKey<ScaffoldState> drawerkey8 = GlobalKey();

  Future<void> pickImage () async {

    image = await ImagePicker()
        .pickImage(source: ImageSource.gallery);

    final storageRef = FirebaseStorage.instance.ref();
    final mountainsRef = storageRef.child("mountains.jpg");
    File file = File(image!.path);
    await mountainsRef.putFile(file);
    String profilePath=await mountainsRef.getDownloadURL();
    // userDetails['profile']=profilePath;



  }

}