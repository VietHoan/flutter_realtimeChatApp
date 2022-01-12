import 'dart:collection';
import 'dart:ffi';

import 'package:chatproject/app/modules/ChatRoom/Controller/ChatRoomController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatRoomPage extends GetView<ChatRoomController> {
  TextEditingController sendTextController = new TextEditingController();
  late List<ItemChat> list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Le Viet Hoan",
              style: TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: ListView(
                children: [
                  ItemChat(
                    isSent: true,
                    text: "Hoan",
                  ),
                  ItemChat(
                    isSent: false,
                    text: "Hieu",
                  ),
                  ItemChat(
                    isSent: false,
                    text: "asdsadsadasdasdadsadasdasdasdadasdasdasdasdasdasdasdasdasdas",
                  ),
                  ItemChat(
                    isSent: false,
                    text: "Hoan",
                  ),
                  ItemChat(
                    isSent: false,
                    text: "Hoan",
                  ),
                  ItemChat(
                    isSent: false,
                    text: "Hoan",
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
            width: Get.width,
            height: 80,
            color: Colors.green,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 5),
                    child: TextField(
                      controller: sendTextController,
                      decoration: InputDecoration(hintText: "Type..."),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: CircleAvatar(
                    radius: 25,
                    child: IconButton(
                      onPressed: () {

                      },
                      icon: Icon(Icons.send),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemChat extends StatelessWidget {
  const ItemChat({
    Key? key,
    required this.isSent,
    required this.text,
  }) : super(key: key);

  final bool isSent;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            color: isSent ? Colors.blue : Colors.red,
            padding: EdgeInsets.all(10),
            child: Text(
              text,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 5,)
        ],
      ),
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
    );
  }
}
