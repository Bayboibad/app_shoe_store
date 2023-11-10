import 'package:app_shoe_store/composents/skeleton.dart';
import 'package:flutter/material.dart';

class SceenHomeLoad extends StatefulWidget {
  const SceenHomeLoad({super.key});

  @override
  State<SceenHomeLoad> createState() => _SceenHomeLoadState();
}

class _SceenHomeLoadState extends State<SceenHomeLoad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
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
              ),
              const SizedBox(height: 8,),
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
      ),
    );
  }
}
