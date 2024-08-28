import 'package:assignbot/component/constent.dart';
import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/pages/user/help.dart';
import 'package:assignbot/pages/user/user_profile.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:assignbot/widgets/custom_button.dart';
import 'package:assignbot/widgets/custom_textfield_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

class UserEditProfile extends StatefulWidget {
  const UserEditProfile({super.key});

  @override
  State<UserEditProfile> createState() => _UserEditProfileState();
}

class _UserEditProfileState extends State<UserEditProfile> {
  UserPrefModel? userPrefModel;
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController designationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      userPrefModel = await UserPreference().getUser();
      Logger().i(userPrefModel?.toJson());

      setState(() {
        fullNameController.text = userPrefModel?.username ?? '';
        emailController.text = '';
        mobileController.text =  '';
        designationController.text =  '';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: const Padding(
          padding: EdgeInsets.only(left: 28.0),
          child: Text(' User Profile', style: TextStyle(fontWeight: FontWeight.w500)),
        ),
        backgroundColor: const Color(0xFFF60205),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            children: [
              SizedBox(height: SC.fromHeight(10)),
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.center,
                children: [
                  Container(
                    width: double.infinity,
                    height: SC.fromHeight(10),
                    decoration: AppConstante.decoration,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18.0),
                        child: Text(
                          '${userPrefModel?.username}',
                          style: GoogleFonts.akshar(fontWeight: FontWeight.w500, fontSize: SC.fromWidth(25)),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -50,
                    child: Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade300,
                        boxShadow: [BoxShadow(color: Colors.grey.shade500, blurRadius: 1)],
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const CircleAvatar(
                            radius: 35,
                            backgroundImage: AssetImage('assets/img.png'),
                          ),
                          Positioned(
                            bottom: 5,
                            right: -10,
                            child: SvgPicture.asset("assets/cameraIcon.svg"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: SC.fromHeight(20)),
              // Container(
              //   width: double.infinity,
              //   decoration: AppConstante.decoration,
              //   child: Column(
              //     children: [
              //       const SizedBox(height: 20),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: [
              //           Text(
              //             'Personal Information',
              //             style: GoogleFonts.akshar(fontWeight: FontWeight.w500, fontSize: SC.fromWidth(22)),
              //           ),
              //           const SizedBox(width: 10),
              //           InkWell(
              //             onTap: () {
              //               Navigator.push(context, MaterialPageRoute(builder: (context) => const UserProfile()));
              //             },
              //             child: SizedBox(
              //               width: 25,
              //               height: 25,
              //               child: Image.asset('assets/edit.png'),
              //             ),
              //           ),
              //         ],
              //       ),
              //       const SizedBox(height: 20),
              //       CustomTextFieldContainer(
              //         hintText: 'Full Name*',
              //         height: SC.fromHeight(16),
              //         controller: fullNameController,
              //         validator: (value) {
              //           if (value == null || value.isEmpty) {
              //             return 'Please enter your name';
              //           }
              //           return null;
              //         },
              //       ),
              //       CustomTextFieldContainer(
              //         hintText: 'Email Id*',
              //         height: SC.fromHeight(16),
              //         controller: emailController,
              //         validator: (value) {
              //           if (value == null || value.isEmpty) {
              //             return 'Please enter your Email Id';
              //           }
              //           return null;
              //         },
              //       ),
              //       CustomTextFieldContainer(
              //         hintText: 'Mobile Number*',
              //         height: SC.fromHeight(16),
              //         controller: mobileController,
              //         validator: (value) {
              //           if (value == null || value.isEmpty) {
              //             return 'Please enter your Mobile Number';
              //           }
              //           return null;
              //         },
              //       ),
              //       CustomTextFieldContainer(
              //         hintText: 'Designation*',
              //         height: SC.fromHeight(16),
              //         controller: designationController,
              //         validator: (value) {
              //           if (value == null || value.isEmpty) {
              //             return 'Please enter your Designation';
              //           }
              //           return null;
              //         },
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(height: SC.fromHeight(20)),
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
            child: Text("Are you sure you want to logout?", style: GoogleFonts.akshar(fontSize: SC.fromWidth(24))),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: SC.fromContextWidth(context, 4),
                  height: SC.fromHeight(25),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFFF60205), Color(0xFFFFDE59)],
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
                  width: SC.fromContextWidth(context, 4),
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

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    designationController.dispose();
    super.dispose();
  }
}