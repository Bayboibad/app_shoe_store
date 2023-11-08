import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SceenHomeLoad extends StatefulWidget {
  const SceenHomeLoad({super.key});

  @override
  State<SceenHomeLoad> createState() => _SceenHomeLoadState();
}

class _SceenHomeLoadState extends State<SceenHomeLoad> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(8),
          alignment: Alignment.topLeft,
          child: Column(children: [
            Skeleton(width: MediaQuery.of(context).size.width, height: 180),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                    flex: 3,
                    // ignore: avoid_unnecessary_containers
                    child: Container(
                      child: const Skeleton(width: 120, height: 30),
                    )),
                const Expanded(flex: 7, child: Text("")),
                const Expanded(
                    flex: 2, child: Skeleton(width: 120, height: 30)),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              children: [
                Skeleton(width: 130, height: 40),
                SizedBox(
                  width: 8,
                ),
                Skeleton(width: 130, height: 40),
                SizedBox(
                  width: 8,
                ),
                Skeleton(width: 118, height: 40),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.topLeft,
              child: const Skeleton(width: 150, height: 30),
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  children: [
                    Skeleton(
                        width: MediaQuery.of(context).size.width, height: 140),
                    const SizedBox(
                      height: 4,
                    ),
                    Skeleton(
                        width: MediaQuery.of(context).size.width, height: 40),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Skeleton(width: 150, height: 30),
                    ),
                  ],
                )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                    child: Column(
                  children: [
                    Skeleton(
                        width: MediaQuery.of(context).size.width, height: 140),
                    const SizedBox(
                      height: 4,
                    ),
                    Skeleton(
                        width: MediaQuery.of(context).size.width, height: 40),
                    const SizedBox(
                      height: 4,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: const Skeleton(width: 150, height: 30),
                    ),
                  ],
                )),
              ],
            )
          ]),
        ),
    );
  }
}

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
