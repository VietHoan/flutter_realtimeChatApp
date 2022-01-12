import 'package:chatproject/app/Controller/auth_controller.dart';
import 'package:chatproject/app/modules/Login/Controller/LoginController.dart';
import 'package:get/get.dart';

class LoginBindings extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}