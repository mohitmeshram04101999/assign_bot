import 'dart:convert';

import 'package:assignbot/models/message_list_model.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;

class FetchMessageApi extends GetxController{

  Rx<MessageListModel>? messagemodel;
  RxList<Message> messages=<Message>[].obs;

  Future<RxList<Message>?>fetchmessageapi (int id)async{

    UserPreference userPreference = UserPreference();
    UserPrefModel userData = await userPreference.getUser();

    var token = userData.token;
    final http.Response response;
    const  apiUrl = 'https://chat.satyakabir.com/chatify/api/fetchMessages';
    var data = {
      'id': id,
    };
    var bodydata = json.encode(data);
    var UrlParse = Uri.parse(apiUrl);

    response = await http.post(
      UrlParse,
      body: bodydata,
      headers: {
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json"
      },
    );



    var dataa = jsonDecode(response.body);

    messagemodel = MessageListModel.fromJson(dataa).obs;
     messages = messagemodel!.value.messages.map((e) => Message.fromJson(e.toJson())).toList().obs;
    // Get.to(ChattingPage());
return messages;
  }


  Future <void> sendMessage(int id,String message) async
  {

    UserPreference userPreference = UserPreference();
    UserPrefModel user = await userPreference.getUser();



    var head = {
  'Authorization': 'Bearer ${user.token}',
  "Content-Type": "application/json"
  };

    Map<String,String> data = {
      "id":id.toString(),
      "message":message,
    };

    const String uri = "https://chat.satyakabir.com/chatify/api/sendMessage";

    var request = http.MultipartRequest("POST",Uri.parse(uri));

    request.headers.addAll(head);

    request.fields.addAll(data);

    var resp = await request.send();

    var d = await  resp.stream.bytesToString();
    print(resp.statusCode);
    print(d);



  }

}




class MessageController with ChangeNotifier
{

  MessageListModel? _messageListModel;
  List<Message> _messages = [];
  bool _loading = true;


  MessageListModel? get  messageListModel=> _messageListModel;
  List<Message> get messages =>_messages;
  bool get loading =>_loading;



  Future<void>fetchmessageapi (int id)async{

    UserPreference userPreference = UserPreference();
    UserPrefModel userData = await userPreference.getUser();

    var token = userData.token;
    final http.Response response;
    const  apiUrl = 'https://chat.satyakabir.com/chatify/api/fetchMessages';
    var data = {
      'id': id,
    };
    var bodydata = json.encode(data);
    var UrlParse = Uri.parse(apiUrl);

    response = await http.post(
      UrlParse,
      body: bodydata,
      headers: {
        'Authorization': 'Bearer $token',
        "Content-Type": "application/json"
      },
    );



    var dataa = jsonDecode(response.body);

    _messageListModel = MessageListModel.fromJson(dataa);
    _messages = _messageListModel!.messages.map((e) => Message.fromJson(e.toJson())).toList();

    _loading = false;
    notifyListeners();
  }


  Future <void> sendMessage(int id,String message) async
  {

    UserPreference userPreference = UserPreference();
    UserPrefModel user = await userPreference.getUser();



    var head = {
      'Authorization': 'Bearer ${user.token}',
      "Content-Type": "application/json"
    };

    Map<String,String> data = {
      "id":id.toString(),
      "message":message,
    };


    const String uri = "https://chat.satyakabir.com/chatify/api/sendMessage";

    var request = http.MultipartRequest("POST",Uri.parse(uri));

    request.headers.addAll(head);

    request.fields.addAll(data);

    var resp = await request.send();

    var d = await  resp.stream.bytesToString();
    var d2 = jsonDecode(d);
    var dataDecode =  d2["message"];

    print("\n${dataDecode}\n");
    Message newMessage =  Message(
      id: dataDecode["id"],
      fromId: dataDecode["from_id"],
      toId: int.parse(dataDecode["to_id"].toString()),
      body: dataDecode["message"],
      attachment: null,
      createdAt: DateTime.parse(dataDecode["created_at"]),
      updatedAt: DateTime.now(),
      seen: 0,
      type: "",
    );
    _messages.insert(0,newMessage);
    notifyListeners();



    print(d);
  }

  addNewMessage(Message message)
  {
    _messages.add(message);
    notifyListeners();
  }

  clear()
  {
    _messages = [];
    _messageListModel = null;
    _loading = true;
    notifyListeners();
  }




}