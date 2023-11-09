import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon icons;
  final bool obscureText;
  final bool enabled;
  final Widget iconButton;

  final String? Function(String?)? onValidate;
  

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icons,
    required this.iconButton,
    required this.onValidate,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      controller: controller,
      obscureText: obscureText,
      enabled: enabled,
      validator: onValidate,
      decoration: InputDecoration(
          icon: icons,
          hintText: hintText,
          suffixIcon: iconButton),
    );
  }
}
