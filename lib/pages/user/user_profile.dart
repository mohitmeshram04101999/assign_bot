import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/pages/logout/logout_page.dart';
import 'package:assignbot/widgets/custom_button.dart';
import 'package:assignbot/widgets/custom_textfield_container.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  TextEditingController  myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 28.0),
          child: Text(' User Profile/Edit',style: TextStyle(fontWeight: FontWeight.w500),),
        ),
        backgroundColor: Color(0xFFF60205),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
        
            children: [
              SizedBox(height: SC.fromHeight(10),),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    
                    width: double.infinity,
                    height: SC.fromHeight(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [Color(0xFFFFFFFF), Color(0xFFFED957)], // define the colors you want in the gradient
                        begin: Alignment.topLeft, // define the start point
                        end: Alignment.bottomRight, // define the end point
                      ),
                    ),
                    child: Center(child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text('Anuradha Mishra',style: TextStyle(fontWeight: FontWeight.w500,fontSize: SC.fromWidth(25)),),
                    ),),
                  ),
        
                  Positioned(
                    top: -50,
                    child: CircleAvatar(
                      foregroundColor: Colors.white,
                      radius: 40,
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage: AssetImage(
                            'assets/img.png'
                        ),
                      ),
        
                      backgroundColor: Colors.white,
        
                    ),
                  )
        
                ],
              ),
        
              SizedBox(height: SC.fromHeight(20),),
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
                    Text('Personal Informaiton',style: TextStyle(fontWeight: FontWeight.w500,fontSize: SC.fromWidth(22)),),
                    SizedBox(height: 20,),

                    // FULL NAME //
                  CustomTextFieldContainer(
                    hintText: 'Full Name',
                    height:  SC.fromHeight(16), // The height of the container
                    controller: myController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),


                    // EMAIL ID //
                    CustomTextFieldContainer(
                      hintText: 'Eail Id',
                      height:  SC.fromHeight(16), // The height of the container
                      controller: myController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Email Id';
                        }
                        return null;
                      },
                    ),


                    // MOBILE NUMBER //
                    CustomTextFieldContainer(
                      hintText: 'Mobile Number',
                      height:  SC.fromHeight(16), // The height of the container
                      controller: myController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Mobile Number';
                        }
                        return null;
                      },
                    ),

                    // DESIGNATION //
                    CustomTextFieldContainer(
                      hintText: 'Designation',
                      height:  SC.fromHeight(16), // The height of the container
                      controller: myController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your Designation';
                        }
                        return null;
                      },
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: CustomButton(text: 'SAVE', onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=>LogoutPage()));
                      },),
                    ),

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
