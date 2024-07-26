
import 'package:assignbot/Mohit/notification.dart';
import 'package:assignbot/component/bottom_navigation_bar.dart';
import 'package:assignbot/component/const.dart';
import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/controller/chat_controllers/contectController.dart';
import 'package:assignbot/firebase_options.dart';
import 'package:assignbot/firebase_options.dart';
import 'package:assignbot/pages/onboard.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'controller/chat_controllers/fetch_message_api.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  FirebaseMessaging.onBackgroundMessage(backGroundMessage);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>MessageController()),
    ChangeNotifierProvider(create: (context)=>ContactController()),
  ],child:const MyApp(),));
}



@pragma('vm:entry-point')
Future<void> backGroundMessage(RemoteMessage message) async
{

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  NotificationService service = await  NotificationService();
  service.initializaionNotification(message);
  service.showNotification(message);

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
    setNotification();
    super.initState();
  }
  getUser()async{
    UserPreference userPreference= UserPreference();
   user=await userPreference.getUser();
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

