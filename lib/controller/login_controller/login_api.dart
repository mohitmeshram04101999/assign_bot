import 'dart:convert';
import 'dart:developer';

import 'package:assignbot/component/bottom_navigation_bar.dart';
import 'package:assignbot/models/user_model.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginApi extends GetxController{


  final emailCont = TextEditingController().obs;
  final passCont = TextEditingController().obs;



  Future<UserModel> userLogin() async{

    UserPreference userPreference = UserPreference();

    final http.Response response;

    final Url ='https://chat.satyakabir.com/chatify/api/admin-login';


    var bodydata ={
      'email' : emailCont.value.text,
      'password': passCont.value.text
    };

    var responseData = json.encode(bodydata);

    var UrlParse = Uri.parse(Url);

      response = await http.post(
        UrlParse,
        body: responseData,
          headers: {
      "Content-Type":"application/json"
      }
    );
    log(response.body);

      final finalData = jsonDecode(response.body);
      UserModel userModel = UserModel.fromJson(finalData);
      if(finalData['success'] == true)
        {

          Get.snackbar('', finalData['message']);
          var token = finalData['data']['token'];
          var userId = finalData['data']['id'];

          UserPrefModel userPrefModel = UserPrefModel(
            token: token,
            userId: userId,
            isLogin: true,
          );

          // Save user data
          await userPreference.saveUser(userPrefModel);

          // Retrieve user data after saving
          UserPrefModel userData = await userPreference.getUser();

          print(userData);
          print(userData.token);

          Get.snackbar('', finalData['message'].toString());
          _clearTextFields([emailCont.value, passCont.value]);
          Get.off(MyBottomNavigationBar());
        }
      return userModel;

  }


  void _clearTextFields(List<TextEditingController> controllers) {
    for(TextEditingController i in controllers){
      i.text='';
    }
  }
}