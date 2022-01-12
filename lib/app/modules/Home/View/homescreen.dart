import 'package:chatproject/app/Controller/auth_controller.dart';
import 'package:chatproject/app/modules/Home/Controller/HomeScreenController.dart';
import 'package:chatproject/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeScreenController> {
  final auth = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    controller.showContact();

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              color: Colors.blue,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "hoan",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: IconButton(
                      icon: Icon(Icons.logout),
                      onPressed: (){
                        auth.logOut();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: controller.conTact.length,
                itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    auth.toConnectChat(controller.conTact[index]["email"]);
                  },
                  leading: CircleAvatar(),
                  title: Text(
                    "${controller.conTact[index]["email"]}",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Chip(
                    label: Text("3"),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => auth.toSearchScreen(),
        child: Icon(Icons.search),
      ),
    );
  }
}
