import 'package:assignbot/component/constent.dart';
import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/widgets/custom_button.dart';
import 'package:assignbot/widgets/custom_textfield_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

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
        title:const  Padding(
          padding: EdgeInsets.only(left: 28.0),
          child:  Text(' User Profile/Edit',style: TextStyle(fontWeight: FontWeight.w500),),
        ),
        backgroundColor: const Color(0xFFF60205),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const  EdgeInsets.symmetric(horizontal: 18.0),
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
                    decoration: AppConstante.decoration,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text('Anuradha Mishra',style: GoogleFonts.akshar(textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: SC.fromWidth(25))),),
                    ),),
                  ),


                   Positioned(
                    top: -50,
                    child: Container(
                      padding: const EdgeInsets.all(3),

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:  Colors.grey.shade300,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade500,
                            blurRadius: 1
                          )
                        ]
                      ),

                      child:  Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage(
                                'assets/img.png'
                            ),
                          ),

                          Positioned(
                            bottom: 5,
                              right: -10,
                              child: SvgPicture.asset("assets/cameraIcon.svg"))
                        ],
                      ),
                    ),
                  ),




                ],
              ),
        
              SizedBox(height: SC.fromHeight(20),),
              Container(
                width: double.infinity,
                // height: SC.fromHeight(2),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.grey.shade300
                  ),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFFFFFF), Color(0xFFFED957)], // define the colors you want in the gradient
                      begin: Alignment.centerLeft, // define the start point
                      end: Alignment.centerRight, // define the end point
                    ),
                  borderRadius: BorderRadius.circular(15)
        
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Text('Personal Informaiton',style: GoogleFonts.akshar(textStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: SC.fromWidth(22))),),
                    const SizedBox(height: 20,),

                    // FULL NAME //
                  CustomTextFieldContainer(
                    hintText: 'Full Name*',
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
                      hintText: 'Email Id*',
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
                      hintText: 'Mobile Number*',
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
                      hintText: 'Designation*',
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
                      padding: const EdgeInsets.all(10),
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
