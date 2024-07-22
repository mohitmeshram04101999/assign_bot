// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  String message;
  bool success;
  Data data;

  UserModel({
    required this.message,
    required this.success,
    required this.data,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    message: json["message"],
    success: json["success"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "success": success,
    "data": data.toJson(),
  };
}

class Data {
  int id;
  String employeeId;
  String name;
  String phone;
  String email;
  dynamic emailVerifiedAt;
  int isAdmin;
  String masterId;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  int online;
  int activeStatus;
  dynamic avatar;
  int darkMode;
  String messengerColor;
  String profile;
  int adminId;
  int conversationId;
  String token;

  Data({
    required this.id,
    required this.employeeId,
    required this.name,
    required this.phone,
    required this.email,
    required this.emailVerifiedAt,
    required this.isAdmin,
    required this.masterId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.online,
    required this.activeStatus,
    required this.avatar,
    required this.darkMode,
    required this.messengerColor,
    required this.profile,
    required this.adminId,
    required this.conversationId,
    required this.token,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    employeeId: json["employee_id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    isAdmin: json["is_admin"],
    masterId: json["master_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    online: json["online"],
    activeStatus: json["active_status"],
    avatar: json["avatar"],
    darkMode: json["dark_mode"],
    messengerColor: json["messenger_color"],
    profile: json["profile"],
    adminId: json["admin_id"],
    conversationId: json["conversation_id"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_id": employeeId,
    "name": name,
    "phone": phone,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "is_admin": isAdmin,
    "master_id": masterId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "online": online,
    "active_status": activeStatus,
    "avatar": avatar,
    "dark_mode": darkMode,
    "messenger_color": messengerColor,
    "profile": profile,
    "admin_id": adminId,
    "conversation_id": conversationId,
    "token": token,
  };
}
