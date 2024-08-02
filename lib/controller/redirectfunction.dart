


import 'package:assignbot/pages/login_pages/login_page.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void reDirect(BuildContext context){
  UserPreference().removeUser();
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>const LoginPage()), (b)=>false);
}