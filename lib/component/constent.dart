import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConstante
{

  static final decoration = BoxDecoration(
    border: Border.all(
        width: 2,
        color: Colors.grey.shade300
    ),
    borderRadius: BorderRadius.circular(10),
    gradient: const LinearGradient(
      colors: [Color(0xFFFFFFFF), Color(0xFFFED957)], // define the colors you want in the gradient
      begin: Alignment.topLeft, // define the start point
      end: Alignment.bottomRight, // define the end point
    ),
  );

}