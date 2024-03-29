import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../constant/color.dart';
import '../constant/text.dart';
import 'custom_drawer.dart';

class ReferFriend extends StatefulWidget {
  const ReferFriend({super.key});

  @override
  State<ReferFriend> createState() => _ReferFriendState();
}

class _ReferFriendState extends State<ReferFriend> {

  final GlobalKey<ScaffoldState> drawerkey9 = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      key: drawerkey9,
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
            drawerkey9.currentState!.openDrawer();
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
          "Refer a Friend",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
              fontSize: 14),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
         height: MediaQuery.of(context).size.height*0.32,
            width: double.maxFinite,
            child: Stack(
              children:[
                Image.asset("assets/img/refer_background.png",fit: BoxFit.cover,width: double.maxFinite,),

                Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Align(
                        alignment: Alignment.topCenter,

                        child: Image.asset("assets/img/earn_img.png",height: 150,)
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("Refer your friends and",
                          style:TextStyle(color: Colors.white,fontWeight: FontWeight.w400,fontSize: 12) ,
                        )
                    ),
                    const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text("Earn \$25.00 each",
                            style:TextStyle(color: Colors.white,fontWeight: FontWeight.w600,fontSize: 18)
                        )
                    ),

                  ],
                ),


              ]


            ),
       ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.05,
          ),
          const Text("Invite Friend & Businesses",
          style: TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 1.2
          ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.02,
          ),
          Text(referText,
          textAlign: TextAlign.center,
            style: TextStyle(
              color: hintTextColor,
              fontWeight: FontWeight.w600,
              fontSize: 12,
              letterSpacing: 1
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.04,
          ),
          DottedBorder(
            color: Colors.grey,
            strokeWidth: 1,
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),


            child: const Text("21800",
            style: TextStyle(
              color: Color(0xff1E40DD),
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1
            ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height*0.07,
          ),
          InkWell(
            onTap: (){
            },
            borderRadius:  BorderRadius.circular(25),
            child: Container(
              width: double.maxFinite,
                margin: const EdgeInsets.symmetric(horizontal: 35),
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 12),

                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: const Color(0xff1E40DD)
                ),
                child: const Center(
                  child: Text("Refer Friend",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )),
          )





        ],
      ),
    );
  }
}
