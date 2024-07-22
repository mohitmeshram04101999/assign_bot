import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/pages/chat/chat_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: GestureDetector(
              onTap: (){
                _showLogoutDialog();
              },
                child: Container(
                  width: SC.fromContextWidth(context, 11),
                  child: Image.asset('assets/log.png'),
                )
            ),
          )
        ],
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Text('Welcome !',style: TextStyle(fontWeight: FontWeight.w500),),
        ),
        backgroundColor: Color(0xFFF60205),
      ),
      body: ListView(
        children: [
          
          SizedBox(height: SC.fromHeight(30),),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 18),
                width: double.infinity,
                height: SC.fromHeight(3),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFFF60C09), Color(0xFFFFD753)],// Replace with your desired colors
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    // border: Border.all(),
                    borderRadius: BorderRadius.circular(10)),
              ),

              Positioned(
                top: SC.fromContextWidth(context, 18),
                left: SC.fromContextWidth(context, 10),
                child: Column(
                  children: [
                    Container(width: 160,child: Text('How are you feeling today?',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: SC.fromWidth(18)),)),
                    SizedBox(height: 10,),
                    Container(width: 140,child: Text('AssignBot will help you with any questions.',style: TextStyle(color: Colors.white,fontSize: SC.fromWidth(25)),)),
                  ],
                ),
              ),

              // ASSIGN BOT IMAGE //
              Positioned(
                top: SC.fromContextWidth(context, 30),
                left: SC.fromContextWidth(context, 2),
                  child:  Container(
                    // decoration: BoxDecoration(border: Border.all()),
                    width:  SC.fromWidth(2.8),
                    height:  SC.fromHeight(4.3),
                    child: Image.asset('assets/1.png',fit: BoxFit.cover,),
                  ),
              ),

              // START CHAT  //
              InkWell(
                onTap: (){
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>  ChattingPage()));
                },
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: SC.fromHeight(4)), // Adjust padding to position correctly
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'START A CHAT',
                            style: TextStyle(
                              color: Color(0xFFF60205),
                              fontSize: SC.fromWidth(22),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(width: 10,),
                          Icon(Icons.arrow_forward, color: Color(0xFFF60205),),
                        ],
                      ),
                      width: SC.fromWidth(1.8),
                      height: SC.fromHeight(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          
        ],
      ),
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          content: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text("Are you sure you want to logout?",style: TextStyle(fontSize: SC.fromWidth(24)),),
          ),
          actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: SC.fromContextWidth(context, 4),
                height: SC.fromHeight(23),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [ Color(0xFFF60205), Color(0xFFFFDE59)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "Yes",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: SC.fromWidth(20),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              Container(
                width:  SC.fromContextWidth(context, 4),
                height: SC.fromHeight(23),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Color(0xFFF60205), Color(0xFFFFDE59)],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "No",
                    style: TextStyle(
                      color: Colors.white,
                       fontSize: SC.fromWidth(20),
                    ),
                  ),
                ),
              ),
            ],
          )
          ],
        );
      },
    );
  }
}
