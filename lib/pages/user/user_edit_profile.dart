//
// import 'package:assignbot/component/constent.dart';
// import 'package:assignbot/component/dimension.dart';
// import 'package:assignbot/component/loder.dart';
// import 'package:assignbot/controller/profile_controller/get_profile_api.dart';
// import 'package:assignbot/pages/user/help.dart';
// import 'package:assignbot/pages/user/user_profile.dart';
// import 'package:assignbot/sharedpref/shared_pref.dart';
// import 'package:assignbot/sharedpref/user_pref_model.dart';
// import 'package:assignbot/widgets/custom_button.dart';
// import 'package:assignbot/widgets/custom_container.dart';
// import 'package:assignbot/widgets/custom_textfield_container.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:logger/logger.dart';
//
// GetProfileApi _getProfileApi = Get.put(GetProfileApi());
//
// class UserEditProfile extends StatefulWidget {
//   const UserEditProfile({super.key});
//
//   @override
//   State<UserEditProfile> createState() => _UserEditProfileState();
// }
//
// class _UserEditProfileState extends State<UserEditProfile> {
//   UserPrefModel? userPrefModel;
//   final TextEditingController fullNameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController mobileController = TextEditingController();
//   final TextEditingController designationController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     // getUserData();
//     _getProfileApi.getProfileapi();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         foregroundColor: Colors.white,
//         automaticallyImplyLeading: false,
//         title: const Padding(
//           padding: EdgeInsets.only(left: 28.0),
//           child: Text(' User Profile', style: TextStyle(fontWeight: FontWeight.w500)),
//         ),
//         backgroundColor: const Color(0xFFF60205),
//       ),
//       body: Obx(() {
//         if (_getProfileApi.isLoading.value) {
//           return Center(child: Loader());
//         } else {
//           return SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18.0),
//               child: Column(
//                 children: [
//                   SizedBox(height: SC.fromHeight(10)),
//                   Stack(
//                     clipBehavior: Clip.none,
//                     alignment: Alignment.center,
//                     children: [
//                       Container(
//                         width: double.infinity,
//                         height: SC.fromHeight(10),
//                         decoration: AppConstante.decoration,
//                         child: Center(
//                           child: Padding(
//                             padding: const EdgeInsets.only(top: 18.0),
//                             child: Text(
//                               _getProfileApi.finaldata.value.data!.name.toString(),
//                               style: GoogleFonts.akshar(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: SC.fromWidth(25)),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: -50,
//                         child: Container(
//                           padding: const EdgeInsets.all(3),
//                           decoration: BoxDecoration(
//                             shape: BoxShape.circle,
//                             color: Colors.grey.shade300,
//                             boxShadow: [BoxShadow(color: Colors.grey.shade500, blurRadius: 1)],
//                           ),
//                           child: Stack(
//                             clipBehavior: Clip.none,
//                             children: [
//                               const CircleAvatar(
//                                 radius: 35,
//                                 backgroundImage: AssetImage('assets/img.png'),
//                               ),
//                               Positioned(
//                                 bottom: 5,
//                                 right: -10,
//                                 child: SvgPicture.asset("assets/cameraIcon.svg"),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: SC.fromHeight(20)),
//                   Container(
//                     width: double.infinity,
//                     decoration: AppConstante.decoration,
//                     child: Column(
//                       children: [
//                         const SizedBox(height: 20),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Personal Information',
//                               style: GoogleFonts.akshar(
//                                   fontWeight: FontWeight.w500,
//                                   fontSize: SC.fromWidth(22)),
//                             ),
//                             const SizedBox(width: 10),
//                             InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => UserProfile(
//                                       name: userPrefModel?.username ?? '',
//                                       email: userPrefModel?.email ?? '',
//                                       phone: userPrefModel?.phone ?? '',
//                                     ),
//                                   ),
//                                 );
//                               },
//                               child: SizedBox(
//                                 width: 25,
//                                 height: 25,
//                                 child: Image.asset('assets/edit.png'),
//                               ),
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 20),
//                         CustomContainer(
//                           text: _getProfileApi.finaldata.value.data!.name.toString(),
//                           height: SC.fromHeight(16),
//                         ),
//                         CustomContainer(
//                           text: _getProfileApi.finaldata.value.data!.email.toString(),
//                           height: SC.fromHeight(16),
//                         ),
//                         CustomContainer(
//                           text: _getProfileApi.finaldata.value.data!.phone.toString(),
//                           height: SC.fromHeight(16),
//                         ),
//                         CustomTextFieldContainer(
//                           hintText: 'Designation*',
//                           height: SC.fromHeight(16),
//                           controller: designationController,
//                           validator: (value) {
//                             if (value == null || value.isEmpty) {
//                               return 'Please enter your Designation';
//                             }
//                             return null;
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: SC.fromHeight(20)),
//                 ],
//               ),
//             ),
//           );
//         }
//       }),
//     );
//   }
//
//   void _showLogoutDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           content: Padding(
//             padding: const EdgeInsets.only(top: 18.0),
//             child: Text(
//                 "Are you sure you want to logout?",
//                 style: GoogleFonts.akshar(fontSize: SC.fromWidth(24))),
//           ),
//           actions: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                     // Add logout logic here
//                   },
//                   child: Container(
//                     width: SC.fromContextWidth(context, 4),
//                     height: SC.fromHeight(25),
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [Color(0xFFF60205), Color(0xFFFFDE59)],
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "Yes",
//                         style: GoogleFonts.akshar(
//                           color: Colors.white,
//                           fontSize: SC.fromWidth(20),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 10),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Container(
//                     width: SC.fromContextWidth(context, 4),
//                     height: SC.fromHeight(25),
//                     decoration: BoxDecoration(
//                       gradient: const LinearGradient(
//                         colors: [Color(0xFFF60205), Color(0xFFFFDE59)],
//                       ),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Center(
//                       child: Text(
//                         "No",
//                         style: GoogleFonts.akshar(
//                           color: Colors.white,
//                           fontSize: SC.fromWidth(20),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   void dispose() {
//     fullNameController.dispose();
//     emailController.dispose();
//     mobileController.dispose();
//     designationController.dispose();
//     super.dispose();
//   }
// }

import 'package:assignbot/component/constent.dart';
import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/component/loder.dart';
import 'package:assignbot/controller/profile_controller/get_profile_api.dart';
import 'package:assignbot/models/get_profile_model.dart';
import 'package:assignbot/pages/user/user_profile.dart';
import 'package:assignbot/sharedpref/shared_pref.dart';
import 'package:assignbot/sharedpref/user_pref_model.dart';
import 'package:assignbot/widgets/custom_container.dart';
import 'package:assignbot/widgets/custom_textfield_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:logger/logger.dart';

GetProfileApi _getProfileApi = GetProfileApi();

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

      body: FutureBuilder<GetProfileModel>(
        future: _getProfileApi.getProfileapi(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Loader());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final profileData = snapshot.data!;
            return SingleChildScrollView(
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
                                profileData.data!.name.toString(),
                                style: GoogleFonts.akshar(
                                    fontWeight: FontWeight.w500,
                                    fontSize: SC.fromContextWidth(context,25)),
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
                    Container(
                      width: double.infinity,
                      decoration: AppConstante.decoration,
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Personal Information',
                                style: GoogleFonts.akshar(
                                    fontWeight: FontWeight.w500,
                                    fontSize: SC.fromWidth(22)),
                              ),
                              const SizedBox(width: 10),
                              // InkWell(
                              //   onTap: () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => UserProfile(
                              //           name: userPrefModel?.username ?? '',
                              //           email: userPrefModel?.email ?? '',
                              //           phone: userPrefModel?.phone ?? '',
                              //         ),
                              //       ),
                              //     );
                              //   },
                              //   child: SizedBox(
                              //     width: 25,
                              //     height: 25,
                              //     child: Image.asset('assets/edit.png'),
                              //   ),
                              // ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          CustomContainer(
                            text: profileData.data!.name.toString(),
                            height: SC.fromHeight(16),
                          ),
                          CustomContainer(
                            text: profileData.data!.email.toString(),
                            height: SC.fromHeight(16),
                          ),
                          CustomContainer(

                            text: profileData.data!.phone.toString(),
                            height: SC.fromHeight(16),
                          ),
                          // CustomTextFieldContainer(
                          //   hintText: 'Designation*',
                          //   height: SC.fromHeight(16),
                          //   controller: designationController,
                          //   validator: (value) {
                          //     if (value == null || value.isEmpty) {
                          //       return 'Please enter your Designation';
                          //     }
                          //     return null;
                          //   },
                          // ),
                        ],
                      ),
                    ),
                    SizedBox(height: SC.fromHeight(20)),
                  ],
                ),
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
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
            child: Text(
                "Are you sure you want to logout?",
                style: GoogleFonts.akshar(fontSize: SC.fromWidth(24))),
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    // Add logout logic here
                  },
                  child: Container(
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
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Container(
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