
import 'dart:developer';

import 'package:assignbot/Mohit/notification.dart';
import 'package:assignbot/component/bottom_navigation_bar.dart';
import 'package:assignbot/component/const.dart';
import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/controller/chat_controllers/contectController.dart';
import 'package:assignbot/firebase_options.dart';
import 'package:assignbot/pages/onboard.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'controller/chat_controllers/fetch_message_api.dart';


// Define the top-level function for handling background messages
@pragma('vm:entry-point')
backgroundNotificationResponseHandler(NotificationResponse notification) async {
  log('Received background notification response: $notification');
}
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  NotificationService().showNotification(message: message);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
FlutterLocalNotificationsPlugin notificationPlugin = FlutterLocalNotificationsPlugin();
  final NotificationService notificationService = NotificationService();
  const AndroidInitializationSettings initializationAndroidSettings = AndroidInitializationSettings('p');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationAndroidSettings,
  );

  await notificationPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (id) async {
      log('Received notification response: $id');
    },
    onDidReceiveBackgroundNotificationResponse: backgroundNotificationResponseHandler,
  );
notificationService.getDeviceToken();
  // Assign the top-level background message handler
  FirebaseMessaging.onBackgroundMessage((message) {
    log('Handling a background message: ${message.messageId}');
    return firebaseMessagingBackgroundHandler(message);
  },);

  FirebaseMessaging.onMessage.listen((message) {
    log('Received message: $message');
    notificationService.showNotification(message: message);
  });

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => MessageController()),
      ChangeNotifierProvider(create: (context) => ContactController()),
    ],
    child: const MyApp(),
  ));
}




class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  UserPrefModel? user;
  @override
  void initState() {
    // TODO: implement initState
    getUser();
    // setNotification();
    super.initState();
  }
  getUser()async{
    UserPreference userPreference= UserPreference();
   user=await userPreference.getUser();
   log('${user?.token}');
   setState(() {

   });
  }
  @override
  Widget build(BuildContext context) {
// log(user!.token.toString());
    SC.getScreen(context);
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home:user?.token!=null&&user?.token!=''?MyBottomNavigationBar(): const OnboardPage(),
             );
  }
}

