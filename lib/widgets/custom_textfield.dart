import 'package:flutter/material.dart';
import 'package:myapp/constants/color.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: secondaryColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: primaryColor,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      validator: validator,
    );
  }
}
