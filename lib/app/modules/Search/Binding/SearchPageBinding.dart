import 'package:chatproject/app/Controller/auth_controller.dart';
import 'package:chatproject/app/modules/Search/Controller/SearchController.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
  }
}