// // To parse this JSON data, do
// //
// //     final userContactModel = userContactModelFromJson(jsonString);
//
// import 'dart:convert';
//
// UserContactModel userContactModelFromJson(String str) => UserContactModel.fromJson(json.decode(str));
//
// String userContactModelToJson(UserContactModel data) => json.encode(data.toJson());
//
// class UserContactModel {
//   List<Contact> contacts;
//   int total;
//   int lastPage;
//
//   UserContactModel({
//     required this.contacts,
//     required this.total,
//     required this.lastPage,
//   });
//
//   factory UserContactModel.fromJson(Map<String, dynamic> json) => UserContactModel(
//     contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
//     total: json["total"],
//     lastPage: json["last_page"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
//     "total": total,
//     "last_page": lastPage,
//   };
// }
//
// class Contact {
//   int id;
//   String employeeId;
//   String name;
//   String phone;
//   String email;
//   dynamic emailVerifiedAt;
//   String password;
//   int isAdmin;
//   String masterId;
//   int status;
//   dynamic rememberToken;
//   DateTime createdAt;
//   DateTime updatedAt;
//   int online;
//   int activeStatus;
//   dynamic avatar;
//   int darkMode;
//   String messengerColor;
//   String profile;
//   int adminId;
//   int conversationId;
//   DateTime maxCreatedAt;
//
//   Contact({
//     required this.id,
//     required this.employeeId,
//     required this.name,
//     required this.phone,
//     required this.email,
//     required this.emailVerifiedAt,
//     required this.password,
//     required this.isAdmin,
//     required this.masterId,
//     required this.status,
//     required this.rememberToken,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.online,
//     required this.activeStatus,
//     required this.avatar,
//     required this.darkMode,
//     required this.messengerColor,
//     required this.profile,
//     required this.adminId,
//     required this.conversationId,
//     required this.maxCreatedAt,
//   });
//
//   factory Contact.fromJson(Map<String, dynamic> json) => Contact(
//     id: json["id"],
//     employeeId: json["employee_id"],
//     name: json["name"],
//     phone: json["phone"],
//     email: json["email"],
//     emailVerifiedAt: json["email_verified_at"],
//     password: json["password"],
//     isAdmin: json["is_admin"],
//     masterId: json["master_id"],
//     status: json["status"],
//     rememberToken: json["remember_token"],
//     createdAt: DateTime.parse(json["created_at"]),
//     updatedAt: DateTime.parse(json["updated_at"]),
//     online: json["online"],
//     activeStatus: json["active_status"],
//     avatar: json["avatar"],
//     darkMode: json["dark_mode"],
//     messengerColor: json["messenger_color"],
//     profile: json["profile"],
//     adminId: json["admin_id"],
//     conversationId: json["conversation_id"],
//     maxCreatedAt: DateTime.parse(json["max_created_at"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "employee_id": employeeId,
//     "name": name,
//     "phone": phone,
//     "email": email,
//     "email_verified_at": emailVerifiedAt,
//     "password": password,
//     "is_admin": isAdmin,
//     "master_id": masterId,
//     "status": status,
//     "remember_token": rememberToken,
//     "created_at": createdAt.toIso8601String(),
//     "updated_at": updatedAt.toIso8601String(),
//     "online": online,
//     "active_status": activeStatus,
//     "avatar": avatar,
//     "dark_mode": darkMode,
//     "messenger_color": messengerColor,
//     "profile": profile,
//     "admin_id": adminId,
//     "conversation_id": conversationId,
//     "max_created_at": maxCreatedAt.toIso8601String(),
//   };
// }

// To parse this JSON data, do
//
//     final userContactModel = userContactModelFromJson(jsonString);

import 'dart:convert';

UserContactModel userContactModelFromJson(String str) => UserContactModel.fromJson(json.decode(str));

String userContactModelToJson(UserContactModel data) => json.encode(data.toJson());

class UserContactModel {
  List<Contact> contacts;
  int total;
  int lastPage;

  UserContactModel({
    required this.contacts,
    required this.total,
    required this.lastPage,
  });

  factory UserContactModel.fromJson(Map<String, dynamic> json) => UserContactModel(
    contacts: List<Contact>.from(json["contacts"].map((x) => Contact.fromJson(x))),
    total: json["total"],
    lastPage: json["last_page"],
  );

  Map<String, dynamic> toJson() => {
    "contacts": List<dynamic>.from(contacts.map((x) => x.toJson())),
    "total": total,
    "last_page": lastPage,
  };
}

class Contact {
  int id;
  String? employeeId;
  String name;
  String phone;
  String email;
  dynamic emailVerifiedAt;
  String password;
  int? isAdmin;
  String masterId;
  int status;
  dynamic rememberToken;
  DateTime createdAt;
  DateTime updatedAt;
  int online;
  int activeStatus;
  String? avatar;
  int darkMode;
  String messengerColor;
  String profile;
  int adminId;
  int conversationId;
  DateTime maxCreatedAt;

  Contact({
    required this.id,
    required this.employeeId,
    required this.name,
    required this.phone,
    required this.email,
    required this.emailVerifiedAt,
    required this.password,
    required this.isAdmin,
    required this.masterId,
    required this.status,
    required this.rememberToken,
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
    required this.maxCreatedAt,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    id: json["id"],
    employeeId: json["employee_id"],
    name: json["name"],
    phone: json["phone"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    password: json["password"],
    isAdmin: json["is_admin"],
    masterId: json["master_id"],
    status: json["status"],
    rememberToken: json["remember_token"],
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
    maxCreatedAt: DateTime.parse(json["max_created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "employee_id": employeeId,
    "name": name,
    "phone": phone,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "password": password,
    "is_admin": isAdmin,
    "master_id": masterId,
    "status": status,
    "remember_token": rememberToken,
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
    "max_created_at": maxCreatedAt.toIso8601String(),
  };
}
