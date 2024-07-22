import 'package:assignbot/component/bottom_navigation_bar.dart';
import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/pages/home_pages/home_page.dart';
import 'package:assignbot/widgets/custom_appbar.dart';
import 'package:assignbot/widgets/custom_button.dart';
import 'package:assignbot/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class SetNewPassword extends StatefulWidget {
  const SetNewPassword({super.key});

  @override
  State<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends State<SetNewPassword> {

  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Set New Password',
        backgroundColor: Color(0xFFF60205),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [

            SizedBox(height: SC.fromHeight(55),),
            //  USER NAME //
            CustomTextField(
              controller: nameController,
              labelText: 'Email',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name cannot be empty';
                }
                // Additional validation logic if needed, e.g., minimum length
                if (value.length < 3) {
                  return 'Name must be at least 3 characters long';
                }
                // You can add more specific validation logic here if required
                return null;
              },
            ),
            SizedBox(height: SC.fromHeight(55),),

            CustomTextField(
              controller: nameController,
              labelText: 'Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name cannot be empty';
                }
                // Additional validation logic if needed, e.g., minimum length
                if (value.length < 3) {
                  return 'Name must be at least 3 characters long';
                }
                // You can add more specific validation logic here if required
                return null;
              },
            ),
            SizedBox(height: SC.fromHeight(55),),

            CustomTextField(
              controller: nameController,
              labelText: 'New Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Name cannot be empty';
                }
                // Additional validation logic if needed, e.g., minimum length
                if (value.length < 3) {
                  return 'Name must be at least 3 characters long';
                }
                // You can add more specific validation logic here if required
                return null;
              },
            ),
            Spacer(),

            CustomButton(text: 'LOGIN', onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyBottomNavigationBar()));
            },),
            SizedBox(height: SC.fromHeight(20),),
          ],
        ),
      ),
    );
  }
}
