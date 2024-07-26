import 'package:assignbot/component/constent.dart';
import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/pages/user/help.dart';
import 'package:assignbot/pages/user/user_profile.dart';
import 'package:assignbot/widgets/custom_button.dart';
import 'package:assignbot/widgets/custom_textfield_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({super.key});

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {

  TextEditingController  myController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const  Padding(
          padding: EdgeInsets.only(left: 28.0),
          child: Text(' User Profile',style: TextStyle(fontWeight: FontWeight.w500),),
        ),
        backgroundColor: const  Color(0xFFF60205),
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
                    decoration: AppConstante.decoration,
                    child: Center(child: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text('Anuradha Mishra',style: GoogleFonts.akshar(fontWeight: FontWeight.w500,fontSize: SC.fromWidth(25)),),
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
                  )

                ],
              ),

              SizedBox(height: SC.fromHeight(20),),
              Container(
                width: double.infinity,
                // height: SC.fromHeight(2),
                decoration:AppConstante.decoration,
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Personal Information',style: GoogleFonts.akshar(fontWeight: FontWeight.w500,fontSize: SC.fromWidth(22)),),
                        const SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>const UserProfile()));
                          },
                          child: SizedBox(
                            width: 25,
                            height: 25,
                            child: Image.asset('assets/edit.png'),
                          ),
                        )
                      ],
                    ),
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

                    // Padding(
                    //   padding: EdgeInsets.all(10),
                    //   child: CustomButton(text: 'SAVE', onPressed: () {
                    //     // Navigator.push(context, MaterialPageRoute(builder: (context)=>LogoutPage()));
                    //   },),
                    // ),

                  ],
                ),
              ),
              SizedBox(height: SC.fromHeight(20),),

              Container(
                width: double.infinity,
                // height: SC.fromHeight(2),
                decoration:  AppConstante.decoration,
                child: Column(
                  children: [


                    const SizedBox(height: 20,),
                    Text('Help & Logout',style: GoogleFonts.akshar(fontWeight: FontWeight.w600,fontSize: SC.fromWidth(20)),),

                    const SizedBox(height: 10,),

                    Padding(
                      padding: const  EdgeInsets.all(10),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const NeedHelp()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            boxShadow: const  [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 3,
                                offset: Offset(0,2)
                              ),
                            ],

                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: SC.fromHeight(16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('NEED HELP',
                                style: GoogleFonts.akshar(fontWeight: FontWeight.w600,fontSize: SC.fromWidth(21),color: const Color(0xFFF60807)),),
                              const SizedBox(width: 5,),
                              const Icon(Icons.arrow_forward,color: Color(0xFFF60807),)
                            ],
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: CustomButton(text: 'LOGOUT', onPressed: () {
                        _showLogoutDialog();
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

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(

          content: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text("Are you sure you want to logout?",style: GoogleFonts.akshar(fontSize: SC.fromWidth(24)),),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width:  SC.fromContextWidth(context, 4),
                  height: SC.fromHeight(25),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [ Color(0xFFF60205), Color(0xFFFFDE59)],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Yes",
                      style: GoogleFonts.akshar(
                        color: Colors.white,
                        fontSize: SC.fromWidth(20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  width:  SC.fromContextWidth(context, 4),
                  height: SC.fromHeight(25),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF60205), Color(0xFFFFDE59)],
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "No",
                      style: GoogleFonts.akshar(
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
