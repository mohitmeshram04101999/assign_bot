



import 'dart:convert';
import 'dart:io';

import 'package:assignbot/models/contactRequestModel.dart';
import 'package:assignbot/models/user_contact_model.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ContactController with ChangeNotifier
{

  List<Request> allRequest = [];

  Future<void> getRequest() async
  {
    String uri = "https://chat.satyakabir.com/chatify/api/request-user";
    UserPrefModel user = await UserPreference().getUser();
    var resp = await http.get(Uri.parse(uri),
        headers: {
      "Authorization": 'Bearer ${user.token}' ,
    });

    if(resp.statusCode==200)
      {
        var _d = jsonDecode(resp.body);
        ContactRequestResponce contactRequestResponce = ContactRequestResponce.fromJson(_d);
        if(contactRequestResponce.data!=null)
          {
            allRequest = contactRequestResponce.data??[];
          }
      }
    else
      {
       print(resp.statusCode);
       print(resp.body);
      }

    notifyListeners();

  }



  Future <void> acceptReq(int id) async
  {
    String uri = "https://chat.satyakabir.com/chatify/api/accept-request?id=$id";


    UserPrefModel user = await UserPreference().getUser();
    var head =  {
      "Authorization": 'Bearer ${user.token}' ,
    };


    var resp =  await http.get(Uri.parse(uri),headers: head);

    if(resp.statusCode==200)
      {
        var _d = jsonDecode(resp.body);
        Contact contact = Contact.fromJson(_d["data"]);
      }
    else
      {
        print(resp.statusCode);
        print(resp.body);
      }


  }

}