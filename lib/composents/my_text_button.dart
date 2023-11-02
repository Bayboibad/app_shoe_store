import 'package:app_shoe_store/configs/colors.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  const MyTextButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          title,
          style: const TextStyle(color: AppColors.blueApp),
        ));
  }
}
