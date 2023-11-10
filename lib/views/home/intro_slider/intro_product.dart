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
                  "https://i.pinimg.com/564x/32/b4/e1/32b4e1726924c26ceaba6ae906cfcdd2.jpg"),
              fit: BoxFit.cover, scale: 1.0)),
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
                      "https://i.pinimg.com/564x/54/ce/ed/54ceeda18a2b91dbebcc54f077566564.jpg"),
                  fit: BoxFit.cover, scale: 1.0)),
        ),
        // ignore: avoid_unnecessary_containers
        Container(
          child: Image.asset("./assets/images/sale.png",width: 100,height: 100,),
        ),
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
                      "https://i.pinimg.com/564x/cd/ed/2f/cded2f9c1b38f15718193357b8533182.jpg"),
                  fit: BoxFit.cover,scale: 1.0)),
        ),
         // ignore: avoid_unnecessary_containers
         Container(
          child: Image.asset("./assets/images/sale.png",width: 100,height: 100,),
        )
      ],
    );
  }
}
