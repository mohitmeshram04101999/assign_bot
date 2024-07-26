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
        title: const Padding(
          padding: EdgeInsets.only(left: 28.0),
          child: Text(
            ' Need Help',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        backgroundColor: const Color(0xFFF60205),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              SizedBox(
                height: SC.fromHeight(55),
              ),
              Center(
                  child: Text(
                'We would love to here from you !',
                style: TextStyle(fontSize: SC.fromWidth(20)),
              )),
              SizedBox(
                height: SC.fromHeight(55),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SizedBox(
                  width: double.infinity,
                  height: SC.fromHeight(2.5),
                  child: Image.asset(
                    'assets/help.png',
                    fit: BoxFit.cover,
                  ),
                  // decoration: BoxDecoration(border: Border.all()),
                ),
              ),
              SizedBox(
                height: SC.fromHeight(35),
              ),
              Container(
                width: double.infinity,
                // height: SC.fromHeight(2),
                decoration: BoxDecoration(

                  border: Border.all(
                    color: Colors.grey.shade300,
                    width: 2
                  ),

                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFFFFFFF),
                        Color(0xFFFED957)
                      ], // define the colors you want in the gradient
                      begin: Alignment.centerLeft, // define the start point
                      end: Alignment.centerRight, // define the end point
                    ),
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Contact Us',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: SC.fromWidth(22)),
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    //
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 15),
                        width: double.infinity,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Phone Number : 1234-123412",style: TextStyle(fontWeight: FontWeight.w500),),
                            SizedBox(
                              height: 8,
                            ),
                            Text("Mobile Number : +91 1234512345",style: TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),

                    //
                    Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 8),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 15),
                        width: double.infinity,
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Email Us : 1234@gmail.com",style: TextStyle(fontWeight: FontWeight.w500),),
                            SizedBox(
                              height: 8,
                            ),
                            Text("                  supprot@gmail.com",style: TextStyle(fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,)
                    //
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
