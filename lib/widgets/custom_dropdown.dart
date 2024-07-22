
import 'package:assignbot/component/dimension.dart';
import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? selectedOption;
  List<String> options = ["Accountant", "Graphic Designer", "Option 2", "Developer", "HR"];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(7),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: selectedOption,
          hint: Text(
            'Select roles for user',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: Colors.black,
              fontSize: SC.fromWidth(26),
            ),
          ),
          icon: Transform.rotate(
            angle: 1.5708, // Rotate 90 degrees clockwise (π/2 radians)
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: Colors.black.withOpacity(0.8),
              size:  SC.fromWidth(24),
            ),
          ),
          isExpanded: true,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: TextStyle(
                  fontSize:  SC.fromWidth(26),
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue;
            });
          },
        ),
      ),
    );
  }
}