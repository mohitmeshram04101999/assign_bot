

import 'dart:convert';

ContactRequestResponce contactRequestResponceFromJson(String str) => ContactRequestResponce.fromJson(json.decode(str));

String contactRequestResponceToJson(ContactRequestResponce data) => json.encode(data.toJson());

class ContactRequestResponce {
  String? status;
  bool? success;
  List<Request>? data;

  ContactRequestResponce({
    this.status,
    this.success,
    this.data,
  });

  factory ContactRequestResponce.fromJson(Map<String, dynamic> json) => ContactRequestResponce(
    status: json["status"],
    success: json["success"],
    data: json["data"] == null ? [] : List<Request>.from(json["data"]!.map((x) => Request.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "success": success,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Request {
  int? id;
  int? staffId;
  int? userId;
  String? userName;
  String? userPhone;
  String? userEmail;

  Request({
    this.id,
    this.staffId,
    this.userId,
    this.userName,
    this.userPhone,
    this.userEmail,
  });

  factory Request.fromJson(Map<String, dynamic> json) => Request(
    id: json["id"],
    staffId: json["staff_id"],
    userId: json["user_id"],
    userName: json["user_name"],
    userPhone: json["user_phone"],
    userEmail: json["user_email"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "staff_id": staffId,
    "user_id": userId,
    "user_name": userName,
    "user_phone": userPhone,
    "user_email": userEmail,
  };
}
