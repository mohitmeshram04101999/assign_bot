//
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:leadkart/add_images/add_images.dart';
// import 'package:leadkart/business_pages/busines_detail.dart';
// import 'package:leadkart/helper/dimention.dart';
// import 'package:leadkart/home_pages/home_screen.dart';
// import 'package:leadkart/leads/ads_image.dart';
// import 'package:leadkart/leads/create_ads_page.dart';
//
//
// class MyBottomNavigationBar extends StatefulWidget {
//   int? page;
//   MyBottomNavigationBar({this.page, super.key});
//
//   @override
//   State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
// }
//
// class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   int curruntPage = 0;
//   late PageController controller;
//   int backPress = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.page != null) {
//       curruntPage = widget.page!;
//     }
//     controller = PageController(initialPage: curruntPage);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async {
//         backPress++;
//         if (backPress == 2) {
//           return true;
//         } else {
//           Timer(Duration(seconds: 1), () {
//             backPress = 0;
//           });
//         }
//         return false;
//       },
//       child: Scaffold(
//         body: PageView(
//           physics: NeverScrollableScrollPhysics(),
//           controller: controller,
//           children: [
//             HomeScreen(),
//             AddImages(),
//             AdsPage(),
//             CreateAds(),
//             BusinessDetail(),
//           ],
//         ),
//         bottomNavigationBar: BottomAppBar(
//           padding: EdgeInsets.only(top: 3),
//           color: Colors.white,
//           child: BottomAppBar(
//             clipBehavior: Clip.hardEdge,
//             padding: EdgeInsets.zero,
//             color: Colors.transparent,
//             shape: CircularNotchedRectangle(),
//             child: BottomNavigationBar(
//               iconSize: SC.from_width(22),
//               type: BottomNavigationBarType.fixed,
//               currentIndex: curruntPage,
//               selectedItemColor: Color.fromRGBO(36, 238, 221, 1),
//               unselectedItemColor: Colors.grey,
//               selectedLabelStyle: TextStyle(color: Color.fromRGBO(36, 238, 221, 1)),
//               unselectedLabelStyle: TextStyle(color: Colors.black26),
//               onTap: (page) {
//                 setState(() {
//                   curruntPage = page;
//                 });
//                 controller.jumpToPage(curruntPage);
//               },
//               items: [
//                 BottomNavigationBarItem(
//                   icon: Icon(Icons.home_outlined),
//                   label: "Home",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Container(
//                     width: SC.from_width(23),
//                     height: SC.from_width(23),
//                     child: Image.asset(
//                       'assets/bottom_nav/5.png',
//                       color: curruntPage == 1 ? Color.fromRGBO(36, 238, 221, 1) : Colors.grey,
//                     ),
//                   ),
//                   label: "Add images",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Container(
//                     width: SC.from_width(23),
//                     height: SC.from_width(23),
//                     child: Image.asset(
//                       'assets/bottom_nav/2.png',
//                       color: curruntPage == 2 ? Color.fromRGBO(36, 238, 221, 1) : Colors.grey,
//                     ),
//                   ),
//                   label: "Ads",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Container(
//                     width: SC.from_width(23),
//                     height: SC.from_width(23),
//                     child: Image.asset(
//                       'assets/bottom_nav/3.png',
//                       color: curruntPage == 3 ? Color.fromRGBO(36, 238, 221, 1) : Colors.grey,
//                     ),
//                   ),
//                   label: "Leads",
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Container(
//                     width: SC.from_width(23),
//                     height: SC.from_width(23),
//                     child: Image.asset(
//                       'assets/bottom_nav/4.png',
//                       color: curruntPage == 4 ? Color.fromRGBO(36, 238, 221, 1) : Colors.grey,
//                     ),
//                   ),
//                   label: "Busines",
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//

import 'dart:async';
import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/pages/chat/chat_page.dart';
import 'package:assignbot/pages/chat/contact_page.dart';
import 'package:assignbot/pages/home_pages/home_page.dart';
import 'package:assignbot/pages/logout/logout_page.dart';
import 'package:assignbot/pages/user/user_edit_profile.dart';
import 'package:assignbot/pages/user/user_profile.dart';
import 'package:flutter/material.dart';

import 'package:animations/animations.dart';



class MyBottomNavigationBar extends StatefulWidget {
  int? page;
  MyBottomNavigationBar({this.page, super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> with SingleTickerProviderStateMixin {
  int currentPage = 0;
  int backPress = 0;

  final List<Widget> pages = [
    HomePage(),
    ContactPage(),
    UserEditProfile(),
    LogoutPage(),

  ];

  @override
  void initState() {
    super.initState();
    if (widget.page != null) {
      currentPage = widget.page!;
    }
  }

  void animateToPage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        backPress++;
        if (backPress == 2) {
          return true;
        } else {
          Timer(Duration(seconds: 1), () {
            backPress = 0;
          });
        }
        return false;
      },
      child: Scaffold(
        body: PageTransitionSwitcher(
          duration: Duration(milliseconds: 700),
          transitionBuilder: (Widget child, Animation<double> animation, Animation<double> secondaryAnimation) {
            return FadeThroughTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              child: child,
            );
          },
          child: pages[currentPage],
        ),

        bottomNavigationBar: BottomAppBar(

          padding: EdgeInsets.only(top: 3),
          color: Colors.white,
          child: BottomAppBar(
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.zero,
            color: Colors.transparent,
            shape: CircularNotchedRectangle(),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              iconSize: SC.from_width(22),
              type: BottomNavigationBarType.fixed,
              currentIndex: currentPage,
              selectedItemColor: Color(0xFFF60205),
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: TextStyle(color: Color(0xFFF60205)),
              unselectedLabelStyle: TextStyle(color: Colors.black26),
              onTap: (page) {
                if (page != currentPage) {
                  animateToPage(page);
                }
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: SC.from_width(23),
                    height: SC.from_width(23),
                    child: Image.asset(
                      'assets/bottomnavigation/chat.png',
                      color: currentPage == 1 ? Color(0xFFF60205) : Colors.grey,
                    ),
                  ),
                  label: "Chat",
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: SC.from_width(23),
                    height: SC.from_width(23),
                    child: Image.asset(
                      'assets/profile.png',
                      color: currentPage == 2 ? Color(0xFFF60205): Colors.grey,
                    ),
                  ),
                  label: "User Profile",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.logout_outlined),
                  label: "Log Out",
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


