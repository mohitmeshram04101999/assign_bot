import 'package:flutter/material.dart';

class CustomTextFieldDecoration extends StatelessWidget {
  final TextEditingController controller;
  final Function()? onSendMessage;

  const CustomTextFieldDecoration({
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
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: TextField(
          maxLines: null,
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Type a message...',
            hintStyle: TextStyle(color: Colors.grey.shade400),
            border: InputBorder.none, // Remove the border from the TextField itself
            contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          style: TextStyle(
            color: Colors.black, // Text color
          ),
          cursorColor: Colors.grey, // Cursor color
        ),
      ),
    );
  }
}
