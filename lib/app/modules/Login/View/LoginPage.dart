import 'package:chatproject/app/Controller/auth_controller.dart';
import 'package:chatproject/app/modules/Login/Controller/LoginController.dart';
import 'package:chatproject/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController>{

  final auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    final TextEditingController userNameController = new TextEditingController();
    final TextEditingController passWordController = new TextEditingController();

    return MaterialApp(
      title: "ChatApp",
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: userNameController,
                decoration: InputDecoration(
                  hintText: "Type your Email",
                  hintStyle: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: passWordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Type your password",
                  hintStyle: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: MaterialButton(
                child: Text("Login"),
                onPressed: (){
                  print(userNameController.text);
                  print(passWordController.text);
                  auth.toHomeScreen(userNameController.text,passWordController.text,context);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}