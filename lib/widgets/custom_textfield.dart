import 'package:assignbot/component/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final List<TextInputFormatter>? format;
  final TextInputType? textInputType;
  final int? maxLength;
  final String labelText;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final double paddingHeight;
  final double borderRadiusHeight;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    Key? key,
    this.format,
    this.maxLength,
    this.textInputType,
    required this.controller,
    required this.labelText,
    this.onChanged,
    this.inputFormatters,
    this.validator,
    this.paddingHeight = 12.0,
    this.borderRadiusHeight = 7.0,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      minLines: 1,
      maxLines: 10,

      inputFormatters: [

        ...?widget.format,
        ...?widget.inputFormatters,
        if (widget.maxLength != null) LengthLimitingTextInputFormatter(widget.maxLength),
      ],
      maxLength: widget.maxLength,
      keyboardType: widget.textInputType,
      controller: widget.controller,
      cursorColor: Colors.grey,
      decoration: InputDecoration(

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        labelText: widget.labelText,
        labelStyle:     TextStyle(color:Colors.black,fontSize: SC.fromWidth(27)),
        contentPadding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 10),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide:
          BorderSide(color: Colors.grey.shade400), // Set border color
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(7),
          borderSide: BorderSide(
              color: Colors.grey.shade400), // Set border color when focused
        ),
      ),
      onChanged: (c){
        if(widget.onChanged!=null)
        {
          widget.onChanged!(c);
        }
        setState(() {

        });
      },
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }
}
