
import 'package:app_settings/app_settings.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final AppSettings appSettings = AppSettings();
  final notifacitionPlugin = FlutterLocalNotificationsPlugin();

  Future<AuthorizationStatus> getPermission()async{

    // PERMISSION //
    NotificationSettings settings = await firebaseMessaging.requestPermission(
        sound: true,
        provisional: true,
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true
    );
    return settings.authorizationStatus;
  }

  // DEVICE TOKEN //
  Future<String?> getDeviceToken() async{
    getnewToken();
    var _t = await firebaseMessaging.getToken();
    print("this is Notification tocke ${_t}");
    return firebaseMessaging.getToken();
  }


  //   GET NEW TOKEN //
  void getnewToken(){
    firebaseMessaging.onTokenRefresh.listen((event) { });
  }

  // INTIALZATIONSETTING
  void initializaionNotification(RemoteMessage message){

    final androidintialsetting = AndroidInitializationSettings("@mipmap/ic_launcher");

    final initialsettion = InitializationSettings(
        android: androidintialsetting
    );

    notifacitionPlugin.initialize(
        initialsettion
    );
  }

  Future<void> showNotification(RemoteMessage message)async {

    final channel = AndroidNotificationChannel('one', 'channelName','Description');

    // FOR ANDROID //
    final androidNotificationDetial = AndroidNotificationDetails(channel.id, channel.name,channel.description,importance:
    Importance.high,
      ticker: 'Ticker',
      priority: Priority.high,
    );

    NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetial,
    );

    notifacitionPlugin.show(1, message.notification!.title,message.notification!.body, notificationDetails);
  }


  void onMessage(){
    FirebaseMessaging.onMessage.listen((message) {
      initializaionNotification(message);
      showNotification(message);
    });
  }

}



Future<void> setNotification() async
{

  NotificationService notificationService = NotificationService();

  var st  = await notificationService.getPermission();
  if(st == AuthorizationStatus.authorized)
  {
    notificationService.onMessage();
  }


}