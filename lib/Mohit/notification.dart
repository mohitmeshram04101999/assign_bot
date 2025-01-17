import 'dart:developer';

import 'package:app_settings/app_settings.dart';
import 'package:assignbot/component/bottom_navigation_bar.dart';
import 'package:assignbot/controller/chat_controller.dart';
import 'package:assignbot/controller/chat_controllers/contectController.dart';
import 'package:assignbot/main.dart';
import 'package:assignbot/models/contactRequestModel.dart';
import 'package:assignbot/pages/login_pages/login_page.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:provider/provider.dart';

class NotificationService {
  final AwesomeNotifications notificationPlugin = AwesomeNotifications();
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final AppSettings appSettings = AppSettings();

  Future<AuthorizationStatus> getPermission() async {
    // PERMISSION //
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    return settings.authorizationStatus;
  }

  // DEVICE TOKEN //
  Future<String?> getDeviceToken() async {
    getNewToken();
    var _t = await firebaseMessaging.getToken();
    print("this is Notification tocke ${_t}");
    return firebaseMessaging.getToken();
  }

  //   GET NEW TOKEN //
  void getNewToken() {
    firebaseMessaging.onTokenRefresh.listen((event) {});
  }

  Future<dynamic> initNotification() async {
    await AwesomeNotifications().initialize("resource://mipmap/ic_launcher", [
      NotificationChannel(
          channelKey: "channelId",
          channelName: "channelId",
          channelDescription: "channelDescription",
          playSound: true,
          soundSource: "resource://raw/sound",
          defaultRingtoneType: DefaultRingtoneType.Alarm,
          importance: NotificationImportance.Max),
    ]);

    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: handleTap,
    );

    var action = await AwesomeNotifications().getInitialNotificationAction();
    return action;
  }

  Future<void> showNotification({
    RemoteMessage? message,
  }) async {
    //
    Logger().i('Showing notification ,\nData in Payload ${message?.data}');

    Map<String, String> payload = {};

    if (message!.data.isNotEmpty) {
      message.data.forEach(
        (key, value) {
          payload[key] = value.toString();
        },
      );
    }

    await notificationPlugin.createNotification(
      content: NotificationContent(
        id: 0,
        channelKey: "channelId",
        title: message.notification?.title ?? "",
        body: message.notification?.body ?? "",
        payload: payload,
        category: message.data["type"]=="request"?NotificationCategory.Alarm:null,
        fullScreenIntent: message.data["type"]=="request",
        wakeUpScreen: true,
      ),
    );
  }
}

Future<void> setNotification() async {
  NotificationService notificationService = NotificationService();

  var st = await notificationService.getPermission();
  log(st.toString());
  if (st == AuthorizationStatus.authorized) {
    log("Permission Granted");
  }
}

@pragma('vm:entry-point')
Future<void> handleTap(ReceivedAction message) async {
  Logger().i("Tap On Notification ${message.buttonKeyInput  }");
  bool isUser = await UserPreference().checkUser();
  Logger().e("user Is $isUser");
  Logger().e("payLode ${message.payload}");
  bool haCalled = false;



  String s1 = (message.payload != null)
      ? message.payload!.toString().replaceAll("{", "")
      : "";
  String s2 = s1.replaceAll("}", "");
  List<String> sp = s2.split(",");

  bool isRequest;
  int? type_id = null;
  if (sp[2].split(" ").contains("request")) {
    isRequest = true;
    Logger().i(sp[1].split(" ")[2]);
    String _p = sp[1].split(" ")[2];
    type_id = int.parse(_p);
  } else {
    isRequest = false;
  }

  if (navigatorKey.currentContext != null) {
    var context = navigatorKey.currentContext!;
    final p = Provider.of<ContactController>(context, listen: false);
    await p.getRequest(context);

    if (isUser) {
      if (isRequest && type_id != null) {
        navigatorKey.currentState!.pushAndRemoveUntil(
            MaterialPageRoute(builder: (context2) {
          WidgetsBinding.instance.addPostFrameCallback((d) {
            if (haCalled == false) {
              p.acceptReq(
                  Request(
                      id: type_id,
                      userName: "NewUser",
                      userEmail: "",
                      userPhone: ""),
                  navigatorKey.currentContext!);
            }
            haCalled = true;
          });

          return MyBottomNavigationBar();
        }), (r) => false);
      }
    } else {
      navigatorKey.currentState!.pushAndRemoveUntil(
          MaterialPageRoute(builder: (context2) {
        return LoginPage(
          requestId: type_id,
        );
      }), (r) => false);
    }
  }
}
