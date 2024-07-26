import 'package:flutter/material.dart';

class CustomTextFieldDecoration extends StatelessWidget {
  final Widget? icon;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final Function()? onSendMessage;

  const CustomTextFieldDecoration({
    this.suffixIcon,
    this.icon,
    required this.controller,
    this.onSendMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          border: Border.all(color: Colors.grey.shade300, width: 1.0), // Border color and width
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          maxLines: null,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: suffixIcon,
            prefixIcon: icon,
            hintText: 'Write your query.....',
            hintStyle: const TextStyle(color: Colors.black),
            border: InputBorder.none, // Remove the border from the TextField itself
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          style: const TextStyle(
            color: Colors.black, // Text color
          ),
          cursorColor: Colors.grey, // Cursor color
        ),
      ),
    );
  }
}
