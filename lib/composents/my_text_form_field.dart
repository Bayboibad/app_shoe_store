import 'package:flutter/material.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final Icon icons;
  final bool obscureText;
  final Widget iconButton;
  final String? Function(String?)? validate;
  

  const MyTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.icons,
    required this.iconButton,
    required this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1, color: Colors.grey)
      ),
      child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validate,
      decoration: InputDecoration(
        border: InputBorder.none,
          icon: icons,
          hintText: hintText,
          suffixIcon: iconButton),
          
       
      // validator: (value) => onValidate,
    ),
    );
  }
}
