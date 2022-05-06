import 'package:flutter/material.dart';
import 'text_field_containers.dart';

class InputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const InputField({
    Key ? key,
    required this.hintText,
    required this.icon,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
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