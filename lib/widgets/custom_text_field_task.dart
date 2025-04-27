import 'package:flutter/material.dart';

class CustomTextFieldTask extends StatelessWidget {
  final TextEditingController controller;

  const CustomTextFieldTask({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        hintText: 'Task',
        hintStyle: const TextStyle(
          fontFamily: 'Inter',
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.white,
        ),
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF232328), width: 2),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0XFF232328), width: 2),
        ),
      ),
    );
  }
}
