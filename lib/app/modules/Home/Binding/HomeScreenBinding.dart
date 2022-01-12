import 'package:chatproject/app/Controller/auth_controller.dart';
import 'package:chatproject/app/modules/Home/Controller/HomeScreenController.dart';
import 'package:get/get.dart';

class HomeScreenBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
  }
}