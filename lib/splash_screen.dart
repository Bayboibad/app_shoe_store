import 'package:app_shoe_store/views/login/auth_page.dart';
import 'package:flutter/material.dart';

class SplashSreen extends StatefulWidget {
  const SplashSreen({super.key});

  @override
  State<SplashSreen> createState() => _SplashSreenState();
}

class _SplashSreenState extends State<SplashSreen> {
   @override
  void initState() {
    Future.delayed(const Duration(seconds: 3),(){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> const AuthPage()));
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        
        child: Image.asset(
          "./assets/images/logo.png",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
