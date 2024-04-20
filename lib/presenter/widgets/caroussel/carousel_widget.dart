import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int activeIndex = 0;
  int currentIndex = 0;
  final List<String> imgList = [
    'images/fraise.jpg',
    'images/fruit-bla.jpg',
    'images/crevette1.jpg',
    'images/crevette2.jpg',
    'images/crevette.jpg',
    'images/panier-image.jpg',
  ];

  // Créez une liste de textes et de boutons correspondant à chaque image
  final List<String> textList = [
    'Profitez de nos prix bas de fraise.',
    'Optez pour une diversité de fruit Bio.',
    'Ofrez-vous des crevette de qualité pous vos plats.',
    'Des crevettes pour vos plats quotidien.',
    'Ne vous inquiètez plus pour la qualité.',
    'Des panier fruit sur mesure pour vous !',
  ];

  final List<String> buttonTextList = [
    'Voir plus',
    'Voir plus',
    'Voir plus',
    'Voir plus',
    'Voir plus',
    'Voir plus',

  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CarouselSlider.builder(
          options: CarouselOptions(
            height: 180,
            autoPlay: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            autoPlayInterval: const Duration(seconds: 2),
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          itemCount: imgList.length,
          itemBuilder: (context, index, realIndex) {
            final image = imgList[index];
            final text = textList[index];
            final buttonText = buttonTextList[index];
            return buildImage(image, index, text, buttonText);
          },
        ),
        const SizedBox(height: 27),
        buildIndicator(),
      ],
    );
  }

  Widget buildImage(String image, int index, String text, String buttonText) =>
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.8),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Container(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                  // height: double.infinity,
                  // width: double.infinity,
                ),
              ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.transparent,
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 10,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 05,
                right: 08,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 12),
                  ),
                  child: Text(
                    buttonText,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: imgList.length,
        effect: const SlideEffect(
          dotHeight: 4,
          dotWidth: 15,
          activeDotColor: Colors.red,
          dotColor: Colors.grey,
        ),
      );
}
