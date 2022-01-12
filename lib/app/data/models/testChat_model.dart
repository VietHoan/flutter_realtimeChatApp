// To parse this JSON data, do
//
//     final chats = chatsFromJson(jsonString);

import 'dart:convert';

Chats chatsFromJson(String str) => Chats.fromJson(json.decode(str));

String chatsToJson(Chats data) => json.encode(data.toJson());

class Chats {
  Chats({
    this.connection,
    this.totalChat,
    this.totalRead,
    this.totalUnread,
    this.chat,
    this.lastTime,
  });

  List<String>? connection;
  int? totalChat;
  int?totalRead;
  int?totalUnread;
  List<Chat>? chat;
  String? lastTime;

  factory Chats.fromJson(Map<String, dynamic> json) => Chats(
    connection: List<String>.from(json["connection"].map((x) => x)),
    totalChat: json["total_chat"],
    totalRead: json["total_read"],
    totalUnread: json["total_unread"],
    chat: List<Chat>.from(json["chat"].map((x) => Chat.fromJson(x))),
    lastTime: json["lastTime"],
  );

  Map<String, dynamic> toJson() => {
    "connection": List<dynamic>.from(connection!.map((x) => x)),
    "total_chat": totalChat,
    "total_read": totalRead,
    "total_unread": totalUnread,
    "chat": List<dynamic>.from(chat!.map((x) => x.toJson())),
    "lastTime": lastTime,
  };
}

class Chat {
  Chat({
    this.sender,
    this.receiver,
    this.message,
    this.isRead,
  });

  String? sender;
  String? receiver;
  String? message;
  bool? isRead;

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    sender: json["sender"],
    receiver: json["receiver"],
    message: json["message"],
    isRead: json["isRead"],
  );

  Map<String, dynamic> toJson() => {
    "sender": sender,
    "receiver": receiver,
    "message": message,
    "isRead": isRead,
  };
}
