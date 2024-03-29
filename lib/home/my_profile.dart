import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texi_book/controller/profile_controller.dart';

import '../constant/color.dart';
import '../constant/vars.dart';
import '../controller/user_controller.dart';
import 'custom_drawer.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {

  ProfileController profileController = Get.find();
  UserController userController = Get.find();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: background,
        key: profileController.drawerkey8,
        drawer: const CustomDrawer(),
        body: ListView(
          children: [
            Column(
              children: [

                SizedBox(
                  height: 200,
                  width: double.maxFinite,
                  child: Stack(
                    children: [
                      Container(
                        height: 160,
                        decoration: BoxDecoration(
                          color: primary,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: InkWell(
                          onTap: () {
                            profileController.drawerkey8.currentState!.openDrawer();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 20),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25)),
                            child: Image.asset(
                              "assets/img/menu.png",
                              height: 25,
                              width: 25,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          "My Profile",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            profileController.image == null ?
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 120,
                                width: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    userController.userDetails['profile']??"",
                                    height: 0,
                                    width: 0,
                                    fit: BoxFit.cover,
                                  ),
                                ))
                                : Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                height: 120,
                                width: 120,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(profileController.image!.path),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                            Material(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.white,
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(50),
                                  onTap: () async {
                                    profileController.pickImage();
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Image.asset(
                                      "assets/img/edit_icon.png",
                                      height: 20,
                                      width: 20,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: () {
                      showAlertNameDialog(context,userController.userDetails['first_name'] ?? "",'first_name');
                    },
                    leading: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffECF1FD),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.person_2_outlined,
                          color: Colors.black,
                          size: 20,
                        )),
                    title: const Text(
                      "First Name",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      userController.userDetails['first_name'] ?? "",
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    trailing: Image.asset(
                      "assets/img/edit_icon.png",
                      height: 20,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: () {
                      showAlertNameDialog(context,userController.userDetails['last_Name'] ?? "",'last_Name');
                    },
                    leading: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffECF1FD),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.person_2_outlined,
                          color: Colors.black,
                          size: 20,
                        )),
                    title: const Text(
                      "Last Name",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      userController.userDetails['last_Name'] ?? "",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    trailing: Image.asset("assets/img/edit_icon.png", height: 20),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20,),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: (){},
                    leading: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffECF1FD),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.call_outlined,
                          color: Colors.black,
                          size: 20,
                        )),
                    title: const Text(
                      "Phone",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      userController.userDetails['phone_Number'] ?? "",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: (){},
                    leading: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffECF1FD),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.email_outlined,
                          color: Colors.black,
                          size: 20,
                        )),
                    title: const Text(
                      "Email",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      userController.userDetails['email'] ?? "",
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),

                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: (){
                      showAlertPasswordDialog(context);
                    },
                    leading: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffECF1FD),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                          size: 20,
                        )),
                    title: const Text(
                      "Password",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "Change Password",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    trailing: Image.asset("assets/img/edit_icon.png", height: 20),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white, borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    onTap: (){
                      showAlertDeleteDialog( context);
                    },
                    leading: Container(
                        decoration: BoxDecoration(
                            color: const Color(0xffECF1FD),
                            borderRadius: BorderRadius.circular(10)),
                        padding: const EdgeInsets.all(8),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.black,
                          size: 20,
                        )),
                    title: const Text(
                      "Delete",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text(
                      "Delete Account",
                      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ]
        ));
  }

  showAlertNameDialog(BuildContext context,String val,String key) {
    TextEditingController textEditingController = TextEditingController(text: val);


    Widget saveButton = TextButton(
      child:  Container(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(8)
          ),

          child: const Text("SAVE",
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold

            ),
          )),
      onPressed:  () {
        userController.userDetails[key]=textEditingController.text;

        FirebaseFirestore.instance.collection("users").doc(userController.userDetails['id']).update(userController.userDetails as Map<Object, Object?>);
        setState(() {

        });
        Navigator.pop(context);
      },
    );
    Widget cancelButton = TextButton(
      child:  Container(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 24),
          decoration: BoxDecoration(
              color: yellow,
              borderRadius: BorderRadius.circular(8)
          ),
          child: const Text("Cancel",
              style: TextStyle
                (color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              )
      )),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Center(
        child: Text("Change Information",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        )),
      ),
      content: TextField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: 'First Name',
            contentPadding:
            const EdgeInsets.symmetric(horizontal: 8),
            hintStyle: TextStyle(
              fontSize: 14,
                fontWeight: FontWeight.bold,
                color: hintTextColor),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
      actions: [
        saveButton,
        cancelButton,

      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertPasswordDialog(BuildContext context) {
    TextEditingController passwordAlert = TextEditingController();

    // set up the buttons

    Widget saveButton = TextButton(
      child:  Container(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
          // margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(8)
          ),
          child: const Text("SAVE",
          style: TextStyle(
            fontSize: 12,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
          )),
      onPressed:  () {
        if (_formKey.currentState!.validate()){}

        // userDetails[key]=textEditingController.text;
        setState(() {

        });
        // Navigator.pop(context);

      },
    );

    Widget cancelButton = TextButton(
      child:  Container(
        padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 24),
        // margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: yellow,
            borderRadius: BorderRadius.circular(8)
          ),
          child: const Text("CANCEL",
          style: TextStyle
            (color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold
          )

          )),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Center(
        child: Text("Change Password",
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold
        )),
      ),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              onChanged: (value){
                if (password.text==profileController.currentPassword.text)
                  {isPasswordMatched=true;
                  } else {
                  isPasswordMatched=false;
                }
              },
              validator: (value) {
                if(value!.isEmpty){
                  return "required";
                }else if(!isPasswordMatched){
                  return "Password not matched";
                }else{
                  return null;
                }
              },
              controller: passwordAlert,
              decoration: InputDecoration(
                hintText: 'Current Password',
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8),
                  hintStyle: TextStyle(
                    fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: hintTextColor),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: profileController.newPassword,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return "required";
                }  else {
                  return null;
                }
              },
              decoration: InputDecoration(
                hintText: 'New Password',
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8),
                  hintStyle: TextStyle(
                    fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: hintTextColor),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              validator: (value) {
                if(value!.isEmpty){
                  return "";
                }else if(!isPasswordMatched){
                  return "Password filed do not match";
                }else{
                  return null;
                }
              },
              controller: profileController.confirmNewPassword,
              decoration: InputDecoration(
                hintText: 'Confirm Password',
                  contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8),
                  hintStyle: TextStyle(
                    fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: hintTextColor),
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black))),
            ),
          ],
        ),
      ),
      actions: [
        saveButton,
        cancelButton,

      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  showAlertDeleteDialog(BuildContext context) {

    TextEditingController deleteAlert = TextEditingController();

    // set up the buttons

    Widget saveButton = TextButton(
      child:  Container(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),
          // margin: EdgeInsets.all(30),
          decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.circular(8)
          ),
          child: const Text("NO",
            style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          )),
      onPressed:  () {
        // userDetails[key]=textEditingController.text;
        setState(() {

        });
        Navigator.pop(context);
      },
    );

    Widget cancelButton = TextButton(
      child:  Container(
          padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 30),

          decoration: BoxDecoration(
              color: primary,
              borderRadius: BorderRadius.circular(8)
          ),
          child: const Text("YES",
              style: TextStyle
                (color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold
              )

          )),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Center(
        child: Text("Are you sure you want to \n delete account?",
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            )),
      ),
      // content: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     TextField(
      //       controller: deleteAlert,
      //       decoration: InputDecoration(
      //           hintText: 'Current Password',
      //           contentPadding:
      //           const EdgeInsets.symmetric(horizontal: 8),
      //           hintStyle: TextStyle(
      //               fontSize: 14,
      //               fontWeight: FontWeight.bold,
      //               color: hintTextColor),
      //           border: const OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black))),
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     TextField(
      //       controller: deleteAlert,
      //       decoration: InputDecoration(
      //           hintText: 'New Password',
      //           contentPadding:
      //           const EdgeInsets.symmetric(horizontal: 8),
      //           hintStyle: TextStyle(
      //               fontSize: 14,
      //               fontWeight: FontWeight.bold,
      //               color: hintTextColor),
      //           border: const OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black))),
      //     ),
      //     const SizedBox(
      //       height: 10,
      //     ),
      //     TextField(
      //       controller: deleteAlert,
      //       decoration: InputDecoration(
      //           hintText: 'Confirm Password',
      //           contentPadding:
      //           const EdgeInsets.symmetric(horizontal: 8),
      //           hintStyle: TextStyle(
      //               fontSize: 14,
      //               fontWeight: FontWeight.bold,
      //               color: hintTextColor),
      //           border: const OutlineInputBorder(
      //               borderSide: BorderSide(color: Colors.black))),
      //     ),
      //   ],
      // ),
      actions: [
        saveButton,
        cancelButton,

      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
