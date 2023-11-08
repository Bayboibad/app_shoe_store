import 'package:app_shoe_store/provider/them_dark_light.dart';
import 'package:app_shoe_store/theme/light_mode.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  const MyButton({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final doubleWidth = screenWidth * 1;
    
    final themProvider = Provider.of<ThemeProvider>(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(doubleWidth, 40),
      ),
      onPressed: onTap,
       child: Text(title, style: TextStyle(
        fontSize:18, fontWeight: FontWeight.bold,
        color: themProvider.currentTheme == lightMode
        ? Colors.black
        : Colors.white
       ),));
  }
}
