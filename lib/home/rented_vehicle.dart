import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../constant/color.dart';
import 'custom_drawer.dart';

class RentedVehicle extends StatefulWidget {
  const RentedVehicle({super.key});

  @override
  State<RentedVehicle> createState() => _RentedVehicleState();
}

class _RentedVehicleState extends State<RentedVehicle> {
  final GlobalKey<ScaffoldState> drawerkey5 = GlobalKey();

  List<dynamic> list=[];
  bool isLoading=false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRentVehicleList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerkey5,
      drawer: const CustomDrawer(),
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: background,
        elevation: 0,
        leading: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            drawerkey5.currentState!.openDrawer();
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Image.asset(
              "assets/img/menu.png",
              height: 10,
              width: 10,
              // alignment: Alignment.topCenter,
            ),
          ),
        ),
        title: const Text(
          "Rented Vehicle",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
              fontSize: 14),
        ),
      ),
      body: isLoading?const Center(child: CircularProgressIndicator()):list.isEmpty?
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/img/drawer_bg.png",
              // height: double.maxFinite,
              width: double.maxFinite,
              // fit: BoxFit.cover,
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height*0.10,
            ),
            const Text("You don't have any rented vehicle. please book ride.",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
                color: Colors.black38

            ),
            )
          ],
        ),
      )

          :

      ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
        return  Container(

          decoration: BoxDecoration(
              boxShadow: const [BoxShadow(color: Colors.black45,offset:Offset(0,2),blurRadius: 3)],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          height: 200,
          margin: const EdgeInsets.only(bottom: 16,left: 12,right: 12),
          width: double.maxFinite,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Image.network(list[index]['car_details']['image'],
                      width: 130,
                      height: 150,
                      fit: BoxFit.contain,
                    ),

                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(list[index]['car_details']['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        const SizedBox(height: 10,),

                        Row(
                          children: [
                            const Icon(Icons.currency_rupee,
                              color: Colors.black54,
                              size: 14,

                            ),
                            Text(list[index]['price']??"",
                              style: const TextStyle(color: Colors.black54,fontWeight: FontWeight.w600,fontSize: 10),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              decoration: BoxDecoration(
                                color: yellow,
                                borderRadius: BorderRadius.circular(5)
                              ),
                              child: Text(getStatus(list[index]['status']),
                                style: const TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black54,

                                ),

                                  ),
                            )

                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(list[index]['start_date'],
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                            ),
                            const SizedBox(width: 5),
                            const Text("to",
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                            ),
                            ),
                            const SizedBox(width: 5),
                             Text(list[index]['end_date'],
                              style: TextStyle(
                                  fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        )

                      ],
                    ),

                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 1,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(top: 8),
                  color: Colors.grey.shade300,
                ),
              ),
              InkWell(
                onTap: () {
                  FirebaseFirestore.instance.collection("Booking").doc(list[index]['id']).delete();
                  list.removeAt(index);
                  setState(() {

                  });

                },
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 40),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: yellow,
                  ),
                  constraints: const BoxConstraints(maxWidth:double.infinity),

                  child: const Text("CANCEL",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w900)),
                ),
              ),

            ],
          ),
        );
      },),
    );
  }

  Future<void> getRentVehicleList() async {

    isLoading=true;
    setState(() {

    });
    QuerySnapshot<Map<String,dynamic>> data= await FirebaseFirestore.instance.collection("Booking").get();
    for(int i=0;i<data.docs.length;i++) {
      var d=data.docs[i].data();
      d['id']=data.docs[i].id;
      DocumentSnapshot car=await FirebaseFirestore.instance.collection("cars").doc(d['carID']).get();
      d['car_details']=car.data();
      list.add(d);
    }
    debugPrint(list.toString());
    isLoading=false;
    setState(() {

    });

  }

  String getStatus( String status) {
    if(status=="0"){
      return "Pending";
    }else if(status=="1"){
      return "Confirm";
    }else if(status=="2"){
      return "In Progress";
    }else if(status=="3"){
      return "Complete";
    }else{
      return "Cancel";
    }
  }
}
