import 'package:flutter/material.dart';


class CategorieWidget extends StatefulWidget {
  const CategorieWidget({super.key});

  @override
  _CategorieWidgetState createState() => _CategorieWidgetState();
}

class _CategorieWidgetState extends State<CategorieWidget> {
  final List<String> categories = [
    'Tous',
    'Fuits',
    'Legumes',
    'Laits',
    'Bien etre',
    'Céréales',
    'Poissons'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      height: 29,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: selectedIndex == index
                    ? Colors.red
                    : Colors.grey[300],
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              child: Text(
                categories[index],
                style: TextStyle(
                  color: selectedIndex == index ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 15),
      ),
    );
  }
}