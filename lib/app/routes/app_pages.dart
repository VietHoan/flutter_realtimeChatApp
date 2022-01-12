import 'package:chatproject/app/modules/ChatRoom/Binding/ChatRoomBinding.dart';
import 'package:chatproject/app/modules/ChatRoom/View/ChatRoom.dart';
import 'package:chatproject/app/modules/Home/Binding/HomeScreenBinding.dart';
import 'package:chatproject/app/modules/Home/View/homescreen.dart';
import 'package:chatproject/app/modules/Login/Binding/LoginBinding.dart';
import 'package:chatproject/app/modules/Login/View/LoginPage.dart';
import 'package:chatproject/app/modules/Search/Binding/SearchPageBinding.dart';
import 'package:chatproject/app/modules/Search/View/SearchPage.dart';
import 'package:chatproject/app/modules/testRoutes.dart';
import 'package:chatproject/app/routes/app_routes.dart';
import 'package:get/get.dart';

class AppPages {
  static const INITIAL = Routes.Login;

  static final routes = [
    GetPage(
        name: Routes.Login, page: () => LoginPage(), binding: LoginBindings()),
    GetPage(name: Routes.HomeChatScreen, page: () => HomeScreen(),binding: HomeScreenBinding()),
    GetPage(name: Routes.Search, page: () => SearchScreen(),binding: SearchBinding()),
    GetPage(name: Routes.TestRoute, page: () => TestRoute()),
    GetPage(name: Routes.ChatRoom, page: () => ChatRoomPage(),binding: ChatRoomBinding()),
  ];
}
