import 'dart:convert';

import 'package:assignbot/models/message_list_model.dart';
import 'package:assignbot/pages/chat/chat_page.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class FetchMessageApi extends GetxController{

  Rx<MessageListModel>? messagemodel;
  RxList<Message> messages=<Message>[].obs;

  Future<RxList<Message>?>fetchmessageapi (int Id)async{

    UserPreference userPreference = UserPreference();
    UserPrefModel userData = await userPreference.getUser();

    var token = userData.token;
    final http.Response response;
    final apiUrl = 'https://chat.satyakabir.com/chatify/api/fetchMessages';
    var data = {
      'id': Id,
    };
    var bodydata = json.encode(data);
    var UrlParse = Uri.parse(apiUrl);
    print('PRINT  2');
    response = await http.post(
      UrlParse,
      body: bodydata,
      headers: {
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json"
      },
    );

    print(response);
    print('PRINT  3');

    var dataa = jsonDecode(response.body);
    print(dataa);

    messagemodel = MessageListModel.fromJson(dataa).obs;
     messages = messagemodel!.value.messages.map((e) => Message.fromJson(e.toJson())).toList().obs;
    // Get.to(ChattingPage());
return messages!;
  }
}