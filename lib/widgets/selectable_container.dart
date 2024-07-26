import 'package:assignbot/component/dimension.dart';
import 'package:flutter/material.dart';

class SelectableContainer extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const SelectableContainer({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: SC.fromWidth(2.4),
        height: SC.fromHeight(20),
        decoration: BoxDecoration(

          boxShadow: [
            if (isSelected)
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
          ],
          gradient: LinearGradient(
            colors: [
              isSelected ?const  Color(0xFFF60205) : Colors.white,
              isSelected ? const Color(0xFFFFDE59) : Colors.white,
            ],
          ),
          borderRadius: BorderRadius.circular(0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: SC.fromWidth(22),
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }
}


class SelectableContainer2 extends StatelessWidget {

  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  const SelectableContainer2({super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Container(
          width: SC.fromContextWidth(context, 2.6),
          height: SC.fromHeight(16),
          decoration: BoxDecoration(
        
            boxShadow: [
              if (isSelected)
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 2,
                  offset: Offset(0, 1),
                ),
            ],
            gradient: LinearGradient(
              colors: [
                isSelected ? Color(0xFFF60205) : Colors.white,
                isSelected ? Color(0xFFFFDE59) : Colors.white,
              ],
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: SC.fromWidth(20),
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

