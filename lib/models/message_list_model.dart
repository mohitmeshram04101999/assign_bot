// To parse this JSON data, do
//
//     final messageListModel = messageListModelFromJson(jsonString);

import 'dart:convert';
import 'dart:developer';

MessageListModel messageListModelFromJson(String str) => MessageListModel.fromJson(json.decode(str));

String messageListModelToJson(MessageListModel data) => json.encode(data.toJson());

class MessageListModel {
  int total;
  int lastPage;
  int lastMessageId;
  List<Message> messages;

  MessageListModel({
    required this.total,
    required this.lastPage,
    required this.lastMessageId,
    required this.messages,
  });

  factory MessageListModel.fromJson(Map<String, dynamic> json) => MessageListModel(
    total: json["total"],
    lastPage: json["last_page"],
    lastMessageId: json["last_message_id"],
    messages: List<Message>.from(json["messages"].map((x) => Message.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "total": total,
    "last_page": lastPage,
    "last_message_id": lastMessageId,
    "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
  };
}

class Message {
  int? id;
  String type;
  int fromId;
  int toId;
  String body;
  dynamic attachment;
  int seen;
  DateTime createdAt;
  DateTime updatedAt;

  Message({
    required this.id,
    required this.type,
    required this.fromId,
    required this.toId,
    required this.body,
    required this.attachment,
    required this.seen,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    // log('converted Time: ${DateTime.parse(json["created_at"].toString().split("+").first)}\n api Time:${json["created_at"]}')

    Duration offset =  const Duration(minutes: 165);



    return Message(
      id: json["id"],
      type: json["type"].toString(),
      fromId: int.parse(json["from_id"].toString()),
      toId: int.parse(json["to_id"].toString()),
      body: json["body"],
      attachment: json["attachment"],
      seen: json["seen"],
      createdAt: DateTime.parse(json["created_at"].toString().split("+").first).add(offset) ,
      updatedAt: DateTime.parse(json["updated_at"].toString().split("+").first).add(offset) ,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "type": type,
    "from_id": fromId,
    "to_id": toId,
    "body": body,
    "attachment": attachment,
    "seen": seen,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
