import 'package:flutter/material.dart';

class MyTextfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final Icon icon;

  const MyTextfield({
    super.key,
    this.controller,
    required this.hintText,
    required this.obscureText, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.orange,width: 2),
          ),
          fillColor: Colors.amber[50],
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey, fontFamily: "Onest"),
          prefixIcon: icon,
        ),
      ),
    );
  }
}
