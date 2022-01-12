import 'package:chatproject/app/modules/ChatRoom/Controller/ChatRoomController.dart';
import 'package:get/get.dart';

class ChatRoomBinding extends Bindings{

  @override
  void dependencies() {
    Get.lazyPut<ChatRoomController>(() => ChatRoomController());
  }
}