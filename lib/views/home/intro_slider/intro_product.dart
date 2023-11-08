import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class IntroProduct extends StatelessWidget {
  const IntroProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImageSlideshow(
        indicatorColor: Colors.blue,
        onPageChanged: (value) {
          debugPrint('Page changed: $value');
        },
        autoPlayInterval: 3000,
        isLoop: true,
        children: const [
          IntroScreenOne(),
          IntroScreenTwe(),
          IntroScreenThere(),
        ],
      ),
    );
  }
}

class IntroScreenOne extends StatelessWidget {
  const IntroScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          image: const DecorationImage(
              image: NetworkImage(
                  "https://img.pikbest.com/origin/06/30/60/89ppIkbEsTD7K.jpg!w700wp"),
              fit: BoxFit.cover)),
    );
  }
}

class IntroScreenTwe extends StatelessWidget {
  const IntroScreenTwe({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/736x/8a/f3/d1/8af3d17dc7113ef31f545b3d22befd98.jpg"),
                  fit: BoxFit.cover)),
        ),
        // ignore: avoid_unnecessary_containers
        Container(
          child: Image.asset("./assets/images/sale.png",width: 100,height: 100,),
        ),
        // Container(
        //   alignment: Alignment.bottomRight,
        //   child: Text("data", style: TextStyle(fontSize: 20, color: Colors.red),),
        // )
      ],
    );
  }
}

class IntroScreenThere extends StatelessWidget {
  const IntroScreenThere({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/564x/4b/8a/61/4b8a6190b2243faa85dacce76c025b07.jpg"),
                  fit: BoxFit.cover)),
        ),
         // ignore: avoid_unnecessary_containers
         Container(
          child: Image.asset("./assets/images/sale.png",width: 100,height: 100,),
        )
      ],
    );
  }
}
