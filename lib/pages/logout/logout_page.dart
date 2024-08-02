import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:assignbot/widgets/selectable_container.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({super.key});

  @override
  State<LogoutPage> createState() => _LogoutPageState();
}

class _LogoutPageState extends State<LogoutPage> {

  bool isNewChatSelected = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title:const  Padding(
          padding: EdgeInsets.only(left: 28.0),
          child: Text(' Logout',style: TextStyle(fontWeight: FontWeight.w500),),
        ),
        backgroundColor: Color(0xFFF60205),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(height: SC.fromHeight(55),),
              Center(child: Text('Are you sure you want to logout ?',style: GoogleFonts.akshar(textStyle: TextStyle(fontSize: SC.fromWidth(20)),fontWeight: FontWeight.w500),)),
              SizedBox(height: SC.fromHeight(55),),
        
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(

                  child: Image.asset('assets/logout.png',fit: BoxFit.contain,),
                  width: double.infinity,
                  height: SC.fromHeight(2.5),
                  // decoration: BoxDecoration(border: Border.all()),
                ),
              ),
              SizedBox(height: SC.fromHeight(35),),
        
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SelectableContainer2(
                    text: 'YES',
                    isSelected: isNewChatSelected,
                    onTap: () async{
                      setState(() {
                        isNewChatSelected = true;
                      });
                      await UserPreference().logOut(context);
                    },
                  ),
                  SelectableContainer2(
                    text: 'NO',
                    isSelected: !isNewChatSelected,
                    onTap: () {
                      setState(() {
                        isNewChatSelected = false;
                      });
                    },
                  ),
                ],
              ),
        
        
            ],
          ),
        ),
      ),
    );
  }
}
