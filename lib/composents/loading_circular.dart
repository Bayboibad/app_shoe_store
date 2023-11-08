import 'package:app_shoe_store/configs/colors.dart';
import 'package:flutter/material.dart';

class LoadingCircular extends StatelessWidget {
  const LoadingCircular({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 30, // Đặt chiều rộng
      height: 30, // Đặt chiều cao
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.BackgroudApp), // Đặt màu sắc
        strokeWidth: 4.0, // Đặt độ dày của vòng tròn
      ),
    );
  }
}
