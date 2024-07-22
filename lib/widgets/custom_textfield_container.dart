import 'package:flutter/material.dart';

class CustomTextFieldContainer extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final double height;
  final EdgeInsets margin;
  final String? Function(String?)? validator;

  // Static values
  static const double _borderRadius = 10.0;
  static const Color _borderColor = Color(0xFFE0E0E0); // Use a hex color code for the shade of grey
  static const double _borderWidth = 1.0;
  static const Color _backgroundColor = Colors.white;
  static const EdgeInsets _contentPadding = EdgeInsets.symmetric(horizontal: 10);
  static const TextStyle _hintStyle = TextStyle(color: Color(0xFF9E9E9E)); // Use a hex color code for the hint text
  static const TextStyle _textStyle = TextStyle(color: Colors.black);
  static const TextInputType _keyboardType = TextInputType.text;

  CustomTextFieldContainer({
    required this.hintText,
    this.controller,
    required this.height,
    this.margin = const EdgeInsets.all(10),
    this.validator,
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
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: _hintStyle, // static hint text style
          border: InputBorder.none,
          contentPadding: _contentPadding, // static content padding
        ),
        style: _textStyle, // static text style
        keyboardType: _keyboardType, // static keyboard type
        validator: validator,
      ),
    );
  }
}
