import 'package:chatproject/app/Controller/auth_controller.dart';
import 'package:chatproject/app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(AuthController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  final TextEditingController userNameController = new TextEditingController();
  final TextEditingController passWordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future:_initialization,
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Scaffold(
              body: Text("123"),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            return GetMaterialApp(
              title: "Chat App",
              initialRoute: AppPages.INITIAL,
              getPages: AppPages.routes,
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
    );
  }
}

