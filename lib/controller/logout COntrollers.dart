import 'dart:convert';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LogOut {

  Future logoutapi(BuildContext context) async{

    UserPreference userPreference = UserPreference();
    UserPrefModel userData = await userPreference.getUser();
    var token = userData.token;
    final http.Response response;

    const Url ='https://chat.satyakabir.com/chatify/api/user-logout';

    final  UrlParse = Uri.parse(Url);
    response = await http.post(
      UrlParse,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );


    var _data = jsonDecode(response.body);

    if(response.statusCode==200)
    {
      Get.snackbar('Logout Succesfully','' );
      print(_data);
      await UserPreference().logOut(context);
    }

    else
      {

      }

  }
}