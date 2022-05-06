import 'package:flutter/material.dart';

import 'text_field_containers.dart';

class PasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String hintText;
  final IconData icon;
  const PasswordField({
    Key ? key,
    required this.onChanged,
    this.icon = Icons.lock,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: Colors.deepOrange,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.deepOrange,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}