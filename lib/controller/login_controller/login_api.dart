import 'dart:convert';
import 'dart:developer';

import 'package:assignbot/component/bottom_navigation_bar.dart';
import 'package:assignbot/component/loder.dart';
import 'package:assignbot/models/user_model.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginApi extends GetxController{


  final emailCont = TextEditingController().obs;
  final passCont = TextEditingController().obs;



  Future<UserModel?> userLogin(final BuildContext context) async{

    UserPreference userPreference = UserPreference();

    final http.Response response;

    const Url ='https://chat.satyakabir.com/chatify/api/admin-login';


    var bodydata ={
      'email' : emailCont.value.text,
      'password': passCont.value.text
    };

    var responseData = json.encode(bodydata);

    final  UrlParse = Uri.parse(Url);

    showDialog(barrierDismissible: false,context: context, builder: (context)=>const Loader());


      response = await http.post(
        UrlParse,
        body: responseData,
          headers: {
      "Content-Type":"application/json"
      }
    );


      var _data = jsonDecode(response.body);

    if(response.statusCode==200)
      {
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

    else
      {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${_data["message"]}")));
      }


    Navigator.pop(context);



  }


  void _clearTextFields(List<TextEditingController> controllers) {
    for(TextEditingController i in controllers){
      i.text='';
    }
  }
}