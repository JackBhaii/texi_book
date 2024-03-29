import 'package:flutter/material.dart';

import '../constant/color.dart';
import 'custom_drawer.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({super.key});

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  final GlobalKey<ScaffoldState> drawerkey10 = GlobalKey();

  List<Map<String, dynamic>> languageList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    languageList
        .add({"img": "assets/flags/FlagBrazil.png", "countryName": "Brasil"});
    languageList
        .add({"img": "assets/flags/arabicFlag.png", "countryName": "Arabic"});
    languageList
        .add({"img": "assets/flags/EnglishFlag.png", "countryName": "English"});
    languageList
        .add({"img": "assets/flags/AmharicFlag.png", "countryName": "Amharic"});
    languageList
        .add({"img": "assets/flags/ChinaFlag.png", "countryName": "Chinese"});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerkey10,
      drawer: const CustomDrawer(),
      backgroundColor: background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: background,
        elevation: 0,
        leading: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            drawerkey10.currentState!.openDrawer();
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
          "Change Language",
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              // letterSpacing: 1,
              fontSize: 16),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Select your language",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.separated(
                itemCount: languageList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.asset(
                      languageList[index]["img"],
                      height: 40,
                      width: 70,
                    ),
                    trailing: Text(
                      languageList[index]["countryName"],
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    onTap: () {},
                    selectedColor: Colors.blue,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: (){

                },
                borderRadius: BorderRadius.circular(25),


                child: Container(
                    height: 60,
                    width: 60,

                    decoration: BoxDecoration(
                        boxShadow: const [
                          // BoxShadow(
                          //     offset: Offset(0, 0), color: Colors.black12, blurRadius: 15)
                        ],
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(45)
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.white,
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
