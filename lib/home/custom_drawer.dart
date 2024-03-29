import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:texi_book/controller/user_controller.dart';
import 'package:texi_book/home/privacy_policy.dart';
import 'package:texi_book/home/promo_code.dart';
import 'package:texi_book/home/refer_friend.dart';
import 'package:texi_book/home/rent_vehicle.dart';
import 'package:texi_book/home/rented_vehicle.dart';
import 'package:texi_book/home/terms_service.dart';
import 'package:url_launcher/url_launcher.dart';

import '../constant/color.dart';
import '../constant/vars.dart';
import '../login/login.dart';
import 'all_rides.dart';
import 'change_language.dart';
import 'countact_us.dart';
import 'favorite_ride.dart';
import 'home_page.dart';
import 'my_profile.dart';
import 'my_wallet.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}


class _CustomDrawerState extends State<CustomDrawer> {

  UserController userController=Get.find();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: primary),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(35),
                  child: Obx(() => Image.network(
                    userController.userDetails['profile']??"",
                    height: 70,
                    width: 70,
                    fit: BoxFit.cover,
                  )),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text(
                      userController.userDetails['first_name'] ?? "",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      userController.userDetails['last_Name'] ?? "",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  userController.userDetails['email'] ?? "",
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          drawerList(
            index: 0,
            onTap: () {
              if (selectedDrawerIndex == 0) {
                Navigator.pop(context);
              } else {
                selectedDrawerIndex = 0;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              }
            },
            icons: Icons.house_outlined,
            title: "Home",
          ),
          drawerList(
            onTap: () {
              selectedDrawerIndex = 1;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AllRides(),
                  ));
              setState(() {});
            },
            index: 1,
            icons: Icons.local_car_wash_outlined,
            title: "All Rides",
          ),
          drawerList(
            onTap: () {
              selectedDrawerIndex = 2;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoriteRide(),
                  ));
              setState(() {});

            },
            index: 2,
            icons: Icons.star_outline,
            title: "Favorite Ride",
          ),
          drawerList(
            onTap: () {
              selectedDrawerIndex = 3;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const RentVehicle(),
                  ));
              setState(() {});
            },
            index: 3,
            icons: Icons.car_rental,
            title: "Rent a Vehicle",
          ),
          drawerList(
            onTap: () {
              selectedDrawerIndex = 4;
              Get.to(RentedVehicle());
              setState(() {});
            },
            index: 4,
            icons: Icons.car_rental,
            title: "Rented Vehicle",
          ),
          drawerList(
            onTap: () {
              selectedDrawerIndex = 5;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PromoCode(),
                  ));
              setState(() {});
            },
            index: 5,
            icons: Icons.sell_outlined,
            title: "Promo Code",
          ),
          drawerList(
            onTap: () {
              selectedDrawerIndex = 6;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>  MyWallet(),
                  ));
              setState(() {});
            },
            index: 6,
            icons: Icons.account_balance_wallet_outlined,
            title: "My Wallet",
          ),
          drawerList(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const MyProfile(),));
              selectedDrawerIndex = 7;
              setState(() {});
            },
            index: 7,
            icons: Icons.person_2_outlined,
            title: "My Profile",
          ),
          drawerList(
            onTap: () {
              selectedDrawerIndex = 8;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReferFriend(),
                  ));
              setState(() {});
            },
            index: 8,
            icons: Icons.group_sharp,
            title: "Refer a Friend",
          ),
          drawerList(
            onTap: () {
              selectedDrawerIndex = 9;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChangeLanguage(),
                  ));
              setState(() {});
            },
            index: 9,
            icons: Icons.language,
            title: "Change Lauguage",
          ),
          drawerList(
            onTap: () {
              selectedDrawerIndex = 10;
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TermsOfService(),
                  ));
              setState(() {});
            },
            index: 10,
            icons: Icons.design_services,
            title: "Terms of Service",
          ),
          drawerList(
            onTap: () {
              selectedDrawerIndex = 11;
              Get.to(const PrivacyPolicy());
              setState(() {});
            },
            index: 11,
            icons: Icons.error,
            title: "Privacy Policy",
          ),
          drawerList(
            onTap: () {
              selectedDrawerIndex = 12;
              Get.to(const ContactUS());
              setState(() {});
            },
            index: 12,
            icons: Icons.support_agent_outlined,
            title: "Contact Us",
          ),
          drawerList(
            onTap: () {
              selectedDrawerIndex = 13;
              setState(() {});
            },
            index: 13,
            icons: Icons.rate_review_outlined,
            title: "Rate Business",
          ),
          drawerList(
            onTap: () {

              GetStorage().write("isLogin", false);
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(
                  builder: (context) => const Login()), (Route route) => false);

            },
            index: 14,
            icons: Icons.logout_outlined,
            title: "Sign Out",
          ),
        ],
      ),
    );
  }

  Widget drawerList(
      {required dynamic icons,
      required String title,
      Function? onTap,
      int? index,
      bool isImage = false}) {
    return InkWell(
      onTap: () {
        onTap!();
      },
      child: ListTile(
        title: Row(
          children: [
            isImage
                ? Image.asset(
                    icons,
                    width: 20,
                    height: 20,
                  )
                : Icon(
                    icons as IconData?,
                    size: 30,
              color: index==selectedDrawerIndex? Colors.blue : Colors.black,
                  ),
            const SizedBox(width: 25),
            Text(
              title,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                  color: index == selectedDrawerIndex
                      ? Colors.blue
                      : Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
