import 'dart:convert';
import 'dart:developer';

import 'package:assignbot/Mohit/notification.dart';
import 'package:assignbot/component/bottom_navigation_bar.dart';
import 'package:assignbot/controller/chat_controllers/contectController.dart';
import 'package:assignbot/main.dart';
import 'package:assignbot/models/contactRequestModel.dart';

import 'package:assignbot/pages/chat/chat_page.dart';
import 'package:assignbot/pages/chat/contact_page.dart';
import 'package:assignbot/pages/login_pages/login_page.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';


setListenerNotification(BuildContext context) async
{

  FlutterLocalNotificationsPlugin notificationPlugin = FlutterLocalNotificationsPlugin();
  final NotificationService notificationService = NotificationService();
  const AndroidInitializationSettings initializationAndroidSettings = AndroidInitializationSettings('p');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationAndroidSettings,
  );

  await notificationPlugin.initialize(

    initializationSettings,
    onDidReceiveNotificationResponse: (message) async {
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
                Logger().e("Calling Notification tis Time");

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
    },
    onDidReceiveBackgroundNotificationResponse: backgroundNotificationResponseHandler,
  );
  notificationService.getDeviceToken();
  // Assign the top-level background message handler
  FirebaseMessaging.onBackgroundMessage((message) async {

    log('Handling a background message: ${message.messageId}');
    await notificationService.showNotification(
      id: int.parse(message.messageId!),
      message: message
    );
    return firebaseMessagingBackgroundHandler(message);
  },);

  FirebaseMessaging.onMessage.listen((message) {
    log('Received message: $message');
    log('opayLodde: ${message.data}');
    notificationService.showNotification(message: message);
  });

}