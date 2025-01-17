import 'dart:developer';

import 'package:assignbot/Mohit/notification.dart';
import 'package:assignbot/component/bottom_navigation_bar.dart';
import 'package:assignbot/controller/chat_controllers/contectController.dart';
import 'package:assignbot/main.dart';
import 'package:assignbot/models/contactRequestModel.dart';


import 'package:assignbot/pages/login_pages/login_page.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:awesome_notifications/awesome_notifications.dart';


setListenerNotification(BuildContext context) async
{

  FlutterLocalNotificationsPlugin notificationPlugin = FlutterLocalNotificationsPlugin();
  final NotificationService notificationService = NotificationService();


  const AndroidInitializationSettings initializationAndroidSettings = AndroidInitializationSettings('@mipmap/launcher_icon');

  Logger().f("1");
  InitializationSettings initializationSettings = InitializationSettings(
    android: initializationAndroidSettings,
  );




  notificationService.initNotification();




  FirebaseMessaging.onMessage.listen((message) {
    log('Received message: $message');
    log('opayLodde: ${message.data}');
    // if(message.data["type"]=="request"&&navigatorKey.currentContext!=null)
    //   {
    //     Provider.of<ContactController>(navigatorKey.currentContext!).getRequest(navigatorKey.currentContext!);
    //   }
    notificationService.showNotification(message: message);
  });

  notificationService.getDeviceToken();




  Logger().f("3");





}


@pragma('vm:entry-point')
backgroundNotificationResponseHandler(NotificationResponse notification) async {
  log('Received background notification response: ${notification.payload}');


  AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails("channelId", "channelName",
  playSound: true,
  priority: Priority.high,
  importance: Importance.max,
  fullScreenIntent: true,
  sound: RawResourceAndroidNotificationSound("sound"));

  NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails
  );

  FlutterLocalNotificationsPlugin().show(0, "Responce", "Tap On Background", notificationDetails);

  Logger().i("Tap On Notification");
  bool isUser =await UserPreference().checkUser() ;
  Logger().e("user Is $isUser");
  Logger().e("payLode ${notification.payload}");
  bool haCalled = false;

  String s1 = (notification.payload!=null)? notification.payload!.replaceAll("{",""):"";
  String s2 = s1.replaceAll("}","");
  List<String> sp = s2.split(",");



  bool isRequest;
  int? type_id = null;
  if(sp[2].split(" ").contains("request"))
  {
    isRequest = true;
    Logger().i(sp[1].split(" ")[2]);
    String _p = sp[1].split(" ")[2];
    type_id = int.parse(_p);
  }
  else
  {
    isRequest =false;
  }


  final p = Provider.of<ContactController>(navigatorKey.currentContext!,listen: false);

  await p.getRequest(navigatorKey.currentContext!);



  if(isUser)
  {

    if(isRequest&& type_id!=null)
    {

      navigatorKey.currentState!.pushAndRemoveUntil( MaterialPageRoute(builder: (context2){
        WidgetsBinding.instance.addPostFrameCallback((d){
          if(haCalled==false)
          {
            p.acceptReq(Request(id: type_id,userName: "NewUser",userEmail: "",userPhone: ""), navigatorKey.currentContext!);
          }
          haCalled = true;
        });


        return MyBottomNavigationBar();
      }),(r)=>false);
    }

  }
  else
  {

    navigatorKey.currentState!.pushAndRemoveUntil( MaterialPageRoute(builder: (context2){
      return LoginPage(requestId: type_id,);
    }),(r)=>false);
  }
}



notificationTap(BuildContext context,{required NotificationResponse message }) async
{

  Logger().i("Tap On Notification");
  bool isUser =await UserPreference().checkUser() ;
  Logger().e("user Is $isUser");
  Logger().e("payLode ${message.payload}");
  bool haCalled = false;

  String s1 = (message.payload!=null)? message.payload!.replaceAll("{",""):"";
  String s2 = s1.replaceAll("}","");
  List<String> sp = s2.split(",");



  bool isRequest;
  int? type_id = null;
  if(sp[2].split(" ").contains("request"))
  {
    isRequest = true;
    Logger().i(sp[1].split(" ")[2]);
    String _p = sp[1].split(" ")[2];
    type_id = int.parse(_p);
  }
  else
  {
    isRequest =false;
  }


  final p = Provider.of<ContactController>(context,listen: false);

  await p.getRequest(context);



  if(isUser)
  {

    if(isRequest&& type_id!=null)
    {

      navigatorKey.currentState!.pushAndRemoveUntil( MaterialPageRoute(builder: (context2){
        WidgetsBinding.instance.addPostFrameCallback((d){
          if(haCalled==false)
          {
            p.acceptReq(Request(id: type_id,userName: "NewUser",userEmail: "",userPhone: ""), navigatorKey.currentContext!);
          }
          haCalled = true;
        });


        return MyBottomNavigationBar();
      }),(r)=>false);
    }

  }
  else
  {

    navigatorKey.currentState!.pushAndRemoveUntil( MaterialPageRoute(builder: (context2){
      return LoginPage(requestId: type_id,);
    }),(r)=>false);
  }
}







