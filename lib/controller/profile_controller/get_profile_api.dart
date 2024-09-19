import 'dart:convert';

import 'package:assignbot/models/get_profile_model.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class GetProfileApi {

  Future<GetProfileModel> getProfileapi() async {

    UserPreference userPreference = UserPreference();
    UserPrefModel userData = await userPreference.getUser();

    var token = userData.token;
    var apiUrl = 'https://chat.satyakabir.com/chatify/api/user-detail';

    var response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      if (jsonData['success'] == true) {
        return GetProfileModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to fetch user profile data');
      }
    } else {
      throw Exception('HTTP Error: ${response.statusCode}');
    }
  }



}
