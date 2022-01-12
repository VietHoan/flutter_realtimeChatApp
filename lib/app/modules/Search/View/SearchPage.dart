import 'package:chatproject/app/Controller/auth_controller.dart';
import 'package:chatproject/app/modules/Search/Controller/SearchController.dart';
import 'package:chatproject/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchScreen extends GetView<SearchController> {
  final auth = Get.find<AuthController>();
  final TextEditingController textSearcController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final List<Widget> myChats = List.generate(
      20,
          (index) => ListTile(
        onTap: () {
          auth.toChatRoomScreen();
        },
        leading: CircleAvatar(),
        title: Text(
          "User${index + 1}",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          "Status${index + 1}",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: Chip(
          label: Text("3"),
        ),
      ),
    );
    return Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          title: Text("Search"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(30, 100, 30, 30),
            child: Align(
              child: TextField(
                controller: textSearcController,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "Search",
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => controller.searchFriend(textSearcController.text),
                  ),
                ),
              ),
            ),
          ),
        ),
        preferredSize: Size.fromHeight(140),
      ),
      body: ListView.builder(
        itemCount: myChats.length,
        itemBuilder: (context, index) => myChats[index],
      ),
    );
  }
}
