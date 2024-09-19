// To parse this JSON data, do
//
//     final getProfileModel = getProfileModelFromJson(jsonString);

import 'dart:convert';

GetProfileModel getProfileModelFromJson(String str) => GetProfileModel.fromJson(json.decode(str));

String getProfileModelToJson(GetProfileModel data) => json.encode(data.toJson());

class GetProfileModel {
  String? status;
  bool? success;
  Data? data;

  GetProfileModel({
    this.status,
    this.success,
    this.data,
  });

  factory GetProfileModel.fromJson(Map<String, dynamic> json) => GetProfileModel(
    status: json["status"],
    success: json["success"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data?.toJson(),
  };
}

class Data {
  int? id;
  String? employeeId;
  String? name;
  String? phone;
  String? email;
  dynamic emailVerifiedAt;
  int? isAdmin;
  String? masterId;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? online;
  int? activeStatus;
  dynamic avatar;
  int? darkMode;
  String? messengerColor;
  String? profile;
  int? adminId;
  int? conversationId;
  dynamic fcmToken;

  Data({
    this.id,
    this.employeeId,
    this.name,
    this.phone,
    this.email,
    this.emailVerifiedAt,
    this.isAdmin,
    this.masterId,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.online,
    this.activeStatus,
    this.avatar,
    this.darkMode,
    this.messengerColor,
    this.profile,
    this.adminId,
    this.conversationId,
    this.fcmToken,
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
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    online: json["online"],
    activeStatus: json["active_status"],
    avatar: json["avatar"],
    darkMode: json["dark_mode"],
    messengerColor: json["messenger_color"],
    profile: json["profile"],
    adminId: json["admin_id"],
    conversationId: json["conversation_id"],
    fcmToken: json["fcm_token"],
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "online": online,
    "active_status": activeStatus,
    "avatar": avatar,
    "dark_mode": darkMode,
    "messenger_color": messengerColor,
    "profile": profile,
    "admin_id": adminId,
    "conversation_id": conversationId,
    "fcm_token": fcmToken,
  };
}
