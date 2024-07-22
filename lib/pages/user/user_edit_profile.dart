import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/pages/user/help.dart';
import 'package:assignbot/pages/user/user_profile.dart';
import 'package:assignbot/widgets/custom_button.dart';
import 'package:assignbot/widgets/custom_textfield_container.dart';
import 'package:flutter/material.dart';

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Personal Informaiton',style: TextStyle(fontWeight: FontWeight.w500,fontSize: SC.fromWidth(22)),),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile()));
                          },
                          child: Container(
                            width: 25,
                            height: 25,
                            child: Image.asset('assets/edit.png'),
                          ),
                        )
                      ],
                    ),
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
                    Text('Help & Logout',style: TextStyle(fontWeight: FontWeight.w600,fontSize: SC.fromWidth(22)),),

                    SizedBox(height: 10,),

                    Padding(
                      padding: EdgeInsets.all(10),
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>NeedHelp()));
                        },
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('NEED HELP',
                                style: TextStyle(fontWeight: FontWeight.w600,fontSize: SC.fromWidth(21),color: Color(0xFFF60807)),),
                              SizedBox(width: 5,),
                              Icon(Icons.arrow_forward,color: Color(0xFFF60807),)
                            ],
                          ),

                          decoration: BoxDecoration(
                            color: Colors.white,
                            // gradient: LinearGradient(
                            //   colors: gradientColors,
                            //   begin: Alignment.topLeft,
                            //   end: Alignment.bottomRight,
                            // ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          height: SC.fromHeight(16),
                        ),
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.all(10),
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
            child: Text("Are you sure you want to logout?",style: TextStyle(fontSize: SC.fromWidth(24)),),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width:  SC.fromContextWidth(context, 4),
                  height: SC.fromHeight(25),
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
                  height: SC.fromHeight(25),
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
