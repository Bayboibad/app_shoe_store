
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key? key,
    required this.width,
    required this.height,
    this.backgroundColor =
        Colors.white, // Màu nền trắng (hoặc màu nền tùy chỉnh)
  }) : super(key: key);

  final double width, height;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300, // Màu nền cho shimmer
      highlightColor: Colors.grey.shade100, // Màu nền nhấn cho shimmer
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(16),
        ),
      ), // Bạn có thể sử dụng Container trống hoặc Text("data") nếu cần
    );
  }
}
