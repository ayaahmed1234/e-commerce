import 'package:flutter/material.dart';

class AppField extends StatelessWidget {
  const AppField({
    super.key,
    required this.hint,
    required this.prefixIcon,
     this.controller,
    this.suffixIcon,
  });
  final String hint;
  final Widget prefixIcon;
  final TextEditingController? controller;

  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,

      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(color: Colors.grey.shade100),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          fontSize: 13,
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w500,
        ),
        fillColor: Colors.grey.shade100,
        filled: true,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
    );
  }
}
