// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.uid,
    this.name,
    this.email,
    this.chat,
  });

  String? uid;
  String? name;
  String? email;
  List<ChatUser>? chat;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    uid: json["uid"],
    name: json["name"],
    email: json["email"],
    chat: List<ChatUser>.from(json["chats"]!.map((x) => ChatUser.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "uid": uid,
    "name": name,
    "email": email,
    "chats": List<dynamic>.from(chat!.map((x) => x.toJson())),
  };
}

class ChatUser {
  ChatUser({
    this.connection,
    this.chatId,
  });

  String? connection;
  String? chatId;

  factory ChatUser.fromJson(Map<String, dynamic> json) => ChatUser(
    connection: json["connection"],
    chatId: json["chat_id"],
  );

  Map<String, dynamic> toJson() => {
    "connection": connection,
    "chat_id": chatId,
  };
}
