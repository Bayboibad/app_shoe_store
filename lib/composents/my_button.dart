import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  const MyButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final doubleWidth = screenWidth * 1;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(doubleWidth, 50),
        

      ),
      onPressed: onTap,
       child: Text(title, style: const TextStyle(
        fontSize:18, fontWeight: FontWeight.bold
       ),));
  }
}
