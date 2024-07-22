import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;
  final Color foregroundColor;
  final IconData backButtonIcon;
  final VoidCallback? onBackButtonPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    required this.backgroundColor,
    this.foregroundColor = Colors.white,
    this.backButtonIcon = Icons.arrow_back_ios,
    this.onBackButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      leading: IconButton(
        icon: Icon(
          backButtonIcon,
          color: foregroundColor,
        ),
        onPressed: onBackButtonPressed ?? () {
          Navigator.of(context).pop();
        },
      ),
      title: Text(
        title,
        style: TextStyle(color: foregroundColor),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
