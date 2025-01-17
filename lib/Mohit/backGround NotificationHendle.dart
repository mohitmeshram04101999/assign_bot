import 'package:assignbot/Mohit/notification.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:logger/logger.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  Logger().e("bacgroubn Notification is Receved ${message.data}");
  await Firebase.initializeApp();



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


  Logger().i('Showing notification ,\nData in Payload ${message.data}');

  Map<String, String> payload = {};

  if (message.data.isNotEmpty) {
    message.data.forEach(
          (key, value) {
        payload[key] = value.toString();
      },
    );
  }

  await AwesomeNotifications().createNotification(
    content: NotificationContent(
      id: 0,
      channelKey: "channelId",
      title: message.notification?.title ?? "",
      body: message.notification?.body ?? "",
      payload: payload,
      category: message.data["type"]=="request"?NotificationCategory.Alarm:null,
      fullScreenIntent: message.data["type"]=="request"?true:false,
      wakeUpScreen: true,
    ),
  );

}