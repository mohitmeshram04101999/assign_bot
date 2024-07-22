import 'package:assignbot/pages/login_pages/otp_page.dart';
import 'package:assignbot/widgets/custom_appbar.dart';
import 'package:assignbot/widgets/custom_button.dart';
import 'package:assignbot/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

import '../../component/dimension.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Forgot Password',
        backgroundColor: Color(0xFFF60205),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            SizedBox(height: SC.fromHeight(55),),
            Wrap(
              children: [
                Text(textAlign: TextAlign.center,'Please enter your registered mobile number or email id so that we can help you to recover your password.',
                  style: TextStyle(fontSize: SC.fromWidth(22),fontWeight: FontWeight.w500),)
              ],
            ),
            SizedBox(height: SC.fromHeight(25),),
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
            Text('Or',style: TextStyle(fontSize: SC.fromWidth(22),fontWeight: FontWeight.w500)),
            SizedBox(height: SC.fromHeight(55),),
            CustomTextField(
              controller: nameController,
              labelText: 'Mobile Number',
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

            CustomButton(text: 'NEXT', onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context)=>OtpPage()));
            },),
            SizedBox(height: SC.fromHeight(20),),
          ],
        ),
      ),
    );
  }
}
