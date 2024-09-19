import 'package:assignbot/component/dimension.dart';
import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final double height;
  final EdgeInsets margin;

  // Static values (same as in CustomTextFieldContainer)
  static const double _borderRadius = 10.0;
  static const Color _borderColor = Color(0xFFE0E0E0); // Use a hex color code for the shade of grey
  static const double _borderWidth = 1.0;
  static const Color _backgroundColor = Colors.white;
  static const EdgeInsets _contentPadding = EdgeInsets.symmetric(horizontal: 10);


  CustomContainer({
    required this.text,
    required this.height,
    this.margin = const EdgeInsets.all(10),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius), // static border radius
        color: _backgroundColor, // static background color
        border: Border.all(
          color: _borderColor, // static border color
          width: _borderWidth, // static border width
        ),
      ),
      child: Padding(
        padding: _contentPadding, // static content padding
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: SC.fromContextWidth(context, 26)),
          ),
        ),
      ),
    );
  }
}
