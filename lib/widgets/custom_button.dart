import 'package:assignbot/component/dimension.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final List<Color> gradientColors;
  final double borderRadius;
  final double fontSize;
  final Color textColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    required this.text,
    this.gradientColors = const [Color(0xFFF60205), Color(0xFFFFDE59)], // Default gradient colors
    this.borderRadius = 10.0, // Default border radius
    this.fontSize = 20.0, // Default font size
    this.textColor = Colors.white, // Default text color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SC.fromHeight(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: GFButton(
        onPressed: onPressed,
        color: Colors.transparent, // Make button background transparent
        borderShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
