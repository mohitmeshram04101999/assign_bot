
import 'package:assignbot/component/bottom_navigation_bar.dart';
import 'package:assignbot/component/const.dart';
import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/pages/onboard.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';

import 'controller/chat_controllers/fetch_message_api.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Gemini.init(apiKey: GEMINI_API_KEY);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context)=>MessageController()),
  ],child:const MyApp(),));
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

