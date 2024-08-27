
import 'package:assignbot/pages/login_pages/login_page.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserPreference{
  Future<bool> saveUser (UserPrefModel responseModal)async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', responseModal.token.toString());
    sp.setString('email', responseModal.email.toString());
    sp.setString('phone', responseModal.phone.toString());
    sp.setInt('userId', responseModal.userId!);
    sp.setString('username', responseModal.username.toString());
    sp.setString('userType',responseModal.userType.toString());
    sp.setBool('isLogin',responseModal.isLogin!);

    return true;
  }

  Future<void> logOut(BuildContext context) async
  {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.clear();
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }



  Future<UserPrefModel> getUser()async{

    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString("token");
    String? email = sp.getString("email");
    String? phone = sp.getString("phone");
    int? userId = sp.getInt("userId");
    String? userType = sp.getString("userType");
    bool? isLogin = sp.getBool("isLogin");
    String? username = sp.getString("username");

Logger().w('User data fetched from SharedPreferences: $token, $userId, $isLogin, $username'); // Debug log

    return UserPrefModel(
      token: token,
      email: email,
      isLogin: isLogin,
      userId: userId,
        phone: phone,
      userType:userType,
      username: username

    );
  }
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    bool success = await sp.clear();
    print('User data cleared: $success'); // Debug log
    return success;
  }


  Future<void> clearToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    await sp.remove('token');
    print('Token removed from SharedPreferences'); // Debug log
  }


}