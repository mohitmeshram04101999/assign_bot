import 'package:assignbot/pages/login_pages/set_new_password.dart';
import 'package:assignbot/widgets/custom_appbar.dart';
import 'package:assignbot/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../component/dimension.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {

  final defaultPinTheme = PinTheme(
    width:  SC.from_height(58),  // Increased width
    height:  SC.from_height(55), // Increased height
    textStyle: TextStyle(
      fontSize:  SC.from_height(18),
      color: Colors.black,
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey.shade200), // Changed border color
      borderRadius: BorderRadius.circular( SC.from_height(10)),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'OTP Verification',
        backgroundColor: Color(0xFFF60205),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [

            SizedBox(height: SC.fromHeight(55),),
            Wrap(
              children: [
                Text('Enter the 6 digit OTP send to your Email Id.',style: TextStyle(fontSize: SC.fromWidth(22)),)
              ],
            ),
            SizedBox(height: SC.fromHeight(35),),
            Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  border: Border.all(color:  Color(0xFFF60205)), // Changed border color for focused state
                  borderRadius: BorderRadius.circular( SC.from_height(10)),
                ),
              ),
              submittedPinTheme: defaultPinTheme.copyWith(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey.shade200), // Keep the border for submitted state
                  borderRadius: BorderRadius.circular( SC.from_height(10)),
                ),
              ),

              separatorBuilder: (index) => SizedBox(width:  SC.from_height(8)),
              // Space between the PIN fields
              onChanged: (value) {
                setState(() {
                  // otp = value;
                });
              },
              onCompleted: (pin) {
                print('PIN completed: $pin');
              },
            ),
            Spacer(),

            CustomButton(text: 'NEXT', onPressed: () {

              Navigator.push(context, MaterialPageRoute(builder: (context)=>SetNewPassword()));
            },),
            SizedBox(height: SC.fromHeight(20),),
          ],
        ),
      ),
    );
  }
}
