import 'package:assignbot/pages/login_pages/login_page.dart';
import 'package:assignbot/widgets/custom_appbar.dart';
import 'package:assignbot/widgets/custom_button.dart';
import 'package:assignbot/widgets/custom_dropdown.dart';
import 'package:assignbot/widgets/custom_rich_text.dart';
import 'package:assignbot/widgets/custom_textfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../component/dimension.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  bool _isValidEmail(String value) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(value);
  }

  final _formKey = GlobalKey<FormState>();
  bool showEmptyNumberError = false;
  TextEditingController mobileController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController DesignationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'SIGNUP',
        backgroundColor: Color(0xFFF60205),
      ),

      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [

              SizedBox(height: SC.fromHeight(55),),
              //  USER NAME //
              CustomTextField(
                controller: nameController,
                labelText: 'Full Name',
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

              // PASSWORD //
              CustomTextField(
                controller: emailController,
                labelText: 'Email Id',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email cannot be empty';
                  }
                  // Check if the entered email is valid
                  if (!_isValidEmail(value)) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
              ),
              SizedBox(height: SC.fromHeight(55),),

              // MOBILE NUMBER //
              CustomTextField(
                textInputType: TextInputType.number,
                // inputFormatters: [LengthLimitingTextInputFormatter(10)],
                controller: mobileController,
                labelText: 'Mobile Number',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    if (showEmptyNumberError) {
                      return 'Mobile No. can not be empty';
                    }
                  } else {
                    // Use regular expression to check if the input contains only numeric digits
                    final RegExp numericRegex = RegExp(r'^[0-9]+$');

                    if (!numericRegex.hasMatch(value)) {
                      return 'Please enter only numeric digits';
                    }

                    // Check for the exact length of 10
                    if (value.length != 10) {
                      return 'Please enter a valid 10-digit Mobile No.';
                    }
                  }
                  return null;
                },

                inputFormatters: [LengthLimitingTextInputFormatter(10)],
              ),


              SizedBox(height: SC.fromHeight(55),),
              // DESIGNATION //
              CustomTextField(
                controller: DesignationController,
                labelText: 'Designation*',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Designation cannot be empty';
                  }
                  // Additional validation logic if needed
                  return null;
                },
              ),

              Expanded(child: Container()),

              // SIGN UP BUTTON //
              CustomButton(text: 'SIGN UP', onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // If the form is valid, display a snackbar or perform any action
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Processing Data')),
                  );
                }
                // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
              },),

              SizedBox(height: SC.fromHeight(55),),
              // RICH TEXT //
              CustomRichText(
                text: 'Don’t have an account Click here to ?',
                clickableText: ' Login',
                fontSize: SC.fromWidth(27), // Pass the font size
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
              ),

              SizedBox(height: 40),


            ],
          ),
        ),
      ),
    );
  }
}

