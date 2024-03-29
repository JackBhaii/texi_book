import 'package:get/get.dart';
import 'package:texi_book/controller/profile_controller.dart';
import 'package:texi_book/controller/rent_vehicle_controller.dart';
import 'package:texi_book/controller/user_controller.dart';

import 'home_controller.dart';

class BindingController implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<UserController>(() => UserController(),fenix: false);
    Get.lazyPut<HomeController>(() => HomeController(),fenix: false);
    Get.lazyPut<ProfileController>(() => ProfileController(),fenix: false);
   Get.lazyPut<RentVehicleController>(() => RentVehicleController(),fenix: false);
  }

}