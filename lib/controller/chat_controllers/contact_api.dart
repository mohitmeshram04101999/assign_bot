import 'dart:convert';
import 'dart:developer';

import 'package:assignbot/models/user_contact_model.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:http/http.dart' as http;

class ContactApi extends GetxController{

  Rx<UserContactModel>? userContactModel;
RxBool isLoading=false.obs;
  fetchContactApi() async{
try {
  isLoading.value=false;
  UserPreference userPreference = UserPreference();
  UserPrefModel userData = await userPreference.getUser();

  var token = userData.token;
  final http.Response response;
  final apiUrl = 'https://chat.satyakabir.com/chatify/api/getContacts';


  var result = await http.get(
    Uri.parse(apiUrl),
    headers: {
      'Authorization': 'Bearer $token',
      'Content-Type': 'application/json',
    },
  );

  print('PRINT 3');

  var finalData = jsonDecode(result.body);
  // print(finalData);
  // if (finalData['success'] == true) {
  print(finalData);

  userContactModel = UserContactModel
      .fromJson(finalData)
      .obs;
  log('${userContactModel?.value}');
  isLoading.value=true;
}catch(e){
  log(e.toString());
}
    }

  // }

}