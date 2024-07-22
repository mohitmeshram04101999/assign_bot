import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/widgets/selectable_container.dart';
import 'package:flutter/material.dart';

class NeedHelp extends StatefulWidget {
  const NeedHelp({super.key});

  @override
  State<NeedHelp> createState() => _NeedHelpState();
}

class _NeedHelpState extends State<NeedHelp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 28.0),
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
              Center(child: Text('We would love to here from you !',style: TextStyle(fontSize: SC.fromWidth(20)),)),
              SizedBox(height: SC.fromHeight(55),),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Container(
                  child: Image.asset('assets/help.png',fit: BoxFit.cover,),
                  width: double.infinity,
                  height: SC.fromHeight(2.5),
                  // decoration: BoxDecoration(border: Border.all()),
                ),
              ),
              SizedBox(height: SC.fromHeight(35),),

              Container(
                width: double.infinity,
                // height: SC.fromHeight(2),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFFFFFFF), Color(0xFFFED957)], // define the colors you want in the gradient
                      begin: Alignment.centerLeft, // define the start point
                      end: Alignment.centerRight, // define the end point
                    ),
                    borderRadius: BorderRadius.circular(15)

                ),
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Text('Contact Us',style: TextStyle(fontWeight: FontWeight.w500,fontSize: SC.fromWidth(22)),),
                    SizedBox(height: 20,),

                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
