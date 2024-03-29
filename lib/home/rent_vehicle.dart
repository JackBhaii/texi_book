
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texi_book/constant/vars.dart';
import 'package:texi_book/controller/rent_vehicle_controller.dart';

import '../constant/color.dart';
import '../controller/user_controller.dart';
import 'custom_drawer.dart';

class RentVehicle extends StatefulWidget {
  const RentVehicle({super.key});

  @override
  State<RentVehicle> createState() => _RentVehicleState();
}

class _RentVehicleState extends State<RentVehicle> {
  final GlobalKey<ScaffoldState> drawerkey4 = GlobalKey();

  UserController userController = Get.find();

  RentVehicleController rentVehicleController = Get.find();
  
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      rentVehicleController.getCars();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: drawerkey4,
        drawer: const CustomDrawer(),
        backgroundColor: background,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: background,
          elevation: 0,
          leading:
          InkWell(
            borderRadius: BorderRadius.circular(25),
            onTap: () {
              drawerkey4.currentState!.openDrawer();
            },
            child: Container(
              margin: const EdgeInsets.all(5),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)),
              child: Image.asset(
                "assets/img/menu.png",
                height: 10,
                width: 10,
                // alignment: Alignment.topCenter,
              ),
            ),
          ) ,

          title: const Text(
            "Rent a Vehicle",
            style: TextStyle(
              color: Colors.black,
                fontWeight: FontWeight.w900,
                letterSpacing: 1,
                fontSize: 14),
          ),
        ),
        body: Obx(() => rentVehicleController.isCarLoading.value?Center(child: CircularProgressIndicator()):ListView.builder(

          shrinkWrap: true,
          itemCount: rentVehicleController.carsList.length,
          itemBuilder: (context, index) {
            return Container(

              decoration: BoxDecoration(
                  boxShadow: const [BoxShadow(color: Colors.black45,offset:Offset(0,2),blurRadius: 3)],
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              height: 150,
              margin: const EdgeInsets.only(bottom: 16,left: 12,right: 12),
              width: double.maxFinite,

              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Image.network(
                          rentVehicleController.carsList[index]['image']??"",
                          width: 130,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(rentVehicleController.carsList[index]['name']??"",
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Icon(Icons.currency_rupee,
                                  color: Colors.black45,
                                  size: 16,

                                ),
                                Text(rentVehicleController.carsList[index]['price']??"",
                                  style: const TextStyle(color: Colors.black45,fontWeight: FontWeight.w600,fontSize: 12),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(Icons.event_seat,color: yellow1,size: 18,),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(rentVehicleController.carsList[index]['seat_size']??"",
                                  style: const TextStyle(color: Colors.black45,fontWeight: FontWeight.w600,fontSize: 12),
                                ),

                              ],
                            ),

                          ],
                        ),

                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 1,
                      width: double.maxFinite,
                      // margin: const EdgeInsets.only(top: 8),
                      color: Colors.grey.shade400,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showBottomSheet(context,rentVehicleController.carsList[index]);
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 30),

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: yellow,
                      ),
                      constraints: const BoxConstraints(maxWidth:double.infinity),

                      child: const Text("BOOK NOW",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 10,
                              fontWeight: FontWeight.w900)),
                    ),
                  ),
                ],
              ),
            );
          },)));
  }



  void showBottomSheet(context,vehicleDetails){
    showModalBottomSheet(

      backgroundColor: Colors.transparent, context: context, builder: (BuildContext context) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: double.maxFinite,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top:Radius.circular(20))
            ),
            // height: 300,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal:10,vertical: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Reservation Information",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 16
                    ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Text("Total to pay",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.grey.shade800,
                            fontWeight: FontWeight.w600
                          ),
                          ),
                        ),
                        Text(vehicleDetails['price']??"",
                        style: TextStyle(
                          fontSize: 12,
                          color:yellow1,
                          fontWeight: FontWeight.w600
                        ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Text("Number of days",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        Obx(() => Text(rentVehicleController.numberOfDays.value,
                          style: TextStyle(
                              fontSize: 12,

                              fontWeight: FontWeight.w600
                          ),
                        ),)
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Text("Start date",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        InkWell(
                         onTap: (){
                           rentVehicleController.selectDate(context);
                         },
                          child: Obx(() => Text(rentVehicleController.selectedDate.value.isEmpty?'Select Start Date':rentVehicleController.selectedDate.value,
                            style: TextStyle(
                                fontSize: 12,

                                fontWeight: FontWeight.w600
                            ),
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: Text("End date",
                            style: TextStyle(
                                fontSize: 11,
                                color: Colors.grey.shade800,
                                fontWeight: FontWeight.w600
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: (){
                            rentVehicleController.selectDate(context,isStartDate: false);
                          },
                          child: Obx(() => Text(rentVehicleController.endDate.value.isEmpty?'Select End Date':rentVehicleController.endDate.value,
                            style: TextStyle(
                                fontSize: 12,

                                fontWeight: FontWeight.w600
                            ),
                          )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Contact number",
                              hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade800,
                                  fontWeight: FontWeight.w600
                              )
                            ),
                          ),
                        ),
                        Icon(Icons.call,
                          color: Colors.grey.shade700,
                          size: 22,
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      children: [
                        InkWell(
                          onTap: () {
                            rentVehicleController.isbooking.value=true;
                            FirebaseFirestore.instance.collection("Booking").add(
                                {
                                  'userID' : userController.userDetails['id'],
                                  'carID' : vehicleDetails['car_id'],
                                  'price' : vehicleDetails['price'],
                                  'status' : "0",
                                  'start_date' : rentVehicleController.selectedDate.value,
                                  'end_date' : rentVehicleController.endDate.value,
                                  'no_of_days' : rentVehicleController.numberOfDays.value,
                                  // 'carImg'  : vehicleDetails['image']


                                }
                                ).then((value) {
                              rentVehicleController.isbooking.value=false;
                                  Get.back();
                            }).onError((error, stackTrace) {
                              rentVehicleController.isbooking.value=false;
                            });

                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal:65),
                            decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child:  Center(
                              child: Obx(() => rentVehicleController.isbooking.value?CircularProgressIndicator(color: Colors.white,):Text("Confirm",
                                style: TextStyle(
                                    fontSize: 11,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600
                                ),
                              )),
                            ),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                           Get.back();
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 8,horizontal:55),

                            decoration: BoxDecoration(
                              color: yellow,
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Center(
                              child: Text("CANCEL",
                                style: TextStyle(
                                    fontSize: 11,

                                    fontWeight: FontWeight.w600
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                ),
              ),
            ),
          )
        ],
      );
    },

    );
  }





}
