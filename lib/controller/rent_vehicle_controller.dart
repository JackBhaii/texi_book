import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RentVehicleController extends GetxController {

  RxString selectedDate = "".obs;
  RxString endDate = "".obs;
  RxBool isbooking = false.obs;
  RxBool isCarLoading = false.obs;
  RxString numberOfDays = "".obs;
  DateTime dateTime=DateTime.now();


  RxList<dynamic> carsList=<dynamic>[].obs;


  Future<void> getCars() async {
    isCarLoading.value=true;

    QuerySnapshot<Map<String,dynamic>> list=await FirebaseFirestore.instance.collection("cars").get();
    carsList.clear();
    for(int i=0;i<list.docs.length;i++){
      var map=list.docs[i].data();
      map['car_id']=list.docs[i].id;
      carsList.add(map);
    }
    isCarLoading.value=false;
  }

  DateTime? sDate;
  DateTime? eDate;


  Future<void> selectDate(BuildContext context,{bool isStartDate=true}) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: dateTime,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      if(isStartDate){
        sDate = picked;
        selectedDate.value="${picked.day}-${picked.month}-${picked.year}";
        // daysBetween()
      }else{
        eDate = picked;
        endDate.value="${picked.day}-${picked.month}-${picked.year}";
      }

      if(sDate != null && eDate != null){
        numberOfDays.value = daysBetween(sDate!,eDate!).toString();
      }

    }
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }


}