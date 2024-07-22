

class UserPrefModel {
  String? token;
  int? userId;
  String? username;
  var userType;// Add this line for the username field
  bool? isLogin;
  String? googleIdToken;


  UserPrefModel({this.token, this.isLogin, this.userId, this.username, this.googleIdToken, this.userType});

  UserPrefModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['userId'];
    username = json['username']; // Add this line for the username field
    isLogin = json['islogin'];
    googleIdToken = json['googleIdToken'];
    userType = json['userType']; // Change userType: to userType =
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['userId'] = this.userId;
    data['username'] = this.username; // Add this line for the username field
    data['islogin'] = this.isLogin;
    data['googleIdToken'] = this.googleIdToken;
    data['userType'] = this.userType; // Add this line for the userType field
    return data;
  }
}
