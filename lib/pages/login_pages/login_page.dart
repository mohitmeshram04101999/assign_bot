import 'package:assignbot/component/dimension.dart';
import 'package:assignbot/controller/login_controller/login_api.dart';
import 'package:assignbot/pages/login_pages/forgot_password.dart';
import 'package:assignbot/widgets/custom_appbar.dart';
import 'package:assignbot/widgets/custom_button.dart';
import 'package:assignbot/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


LoginApi _loginApi = Get.put(LoginApi());

class LoginPage extends StatefulWidget {
  final int? requestId;
  const LoginPage({this.requestId,super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final _formKey = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text('Login'),
        foregroundColor: Colors.white,

        backgroundColor: Color(0xFFF60205),
        title: Text('Login',style: TextStyle(color: Colors.white),),
      ),
      // const  CustomAppBar(
      //   title: 'Login',
      //   backgroundColor: Color(0xFFF60205),
      // ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: SC.fromHeight(25),),
              //  USER NAME //
              CustomTextField(
                controller: _loginApi.emailCont.value,
                labelText: 'UserName or Email*',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name cannot be empty';
                  }

                  if(value.endsWith("@gmail.com")==false)
                    {
                      return "Enter proper Email";
                    }

                  // Additional validation logic if needed, e.g., minimum length
                  if (value.length < 3) {
                    return 'Name must be at least 3 characters long';
                  }

                  // You can add more specific validation logic here if required
                  return null;

                },
              ),
              SizedBox(height: SC.fromHeight(45),),

              // PASSWORD //
              CustomTextField(
                obSecure: true,
                controller: _loginApi.passCont.value,
                labelText: 'Password*',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password cannot be empty';
                  }

                  // Additional validation logic if needed
                  return null;
                },
              ),

              SizedBox(height: SC.fromHeight(55),),

              Row(

                children: [
                 const  Spacer(),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPassword()));
                  },
                    child: const Text('Forgot Password ?',style: TextStyle(fontSize: 16,color: Color(0xFFF60205)),)),
              ],),
              SizedBox(height: SC.fromHeight(45),),
              // Role selection //
              // CustomDropdown(),
              Expanded(child: Container()),
              CustomButton(text: 'LOGIN', onPressed: () {

                if (_formKey.currentState!.validate()) {
                  _loginApi.userLogin(context,requestId: widget.requestId);
                }

                // Navigator.push(context, MaterialPageRoute(builder: (context)=>SignupPage()));

              },),

              SizedBox(height: SC.fromHeight(45),),


              // CustomRichText(
              //   text: 'Don’t have an account Click here to ?',
              //   clickableText: ' Sign Up',
              //   fontSize: SC.fromWidth(27), // Pass the font size
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(builder: (context) => const SignupPage()),
              //     );
              //   },
              // ),

              const SizedBox(height: 40),


            ],
          ),
        ),
      ),
    );
  }
}
