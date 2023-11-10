import 'package:app_shoe_store/composents/skeleton.dart';
import 'package:flutter/material.dart';

class ScreenLoadLove extends StatelessWidget {
  const ScreenLoadLove({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Container(
            margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
            
            child: Row(
              children: [
                Skeleton(width: 130, height: 110),
                Container(
                  padding: const EdgeInsets.only(left: 8),
                  child: Column(
                    children: [
                      Skeleton(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 40),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Skeleton(
                              width: MediaQuery.of(context).size.width * 0.25,
                              height: 20),
                          Skeleton(
                              width: MediaQuery.of(context).size.width * 0.35,
                              height: 20),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Skeleton(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: 20)
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
