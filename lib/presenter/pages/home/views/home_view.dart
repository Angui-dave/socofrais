import 'package:flutter/material.dart';
import 'package:socofrais/domain/entities/product.dart';
import 'package:socofrais/presenter/widgets/bottomnavigation/bottomnav_widget.dart';
import 'package:socofrais/presenter/widgets/caroussel/carousel_widget.dart';
import 'package:socofrais/presenter/widgets/categories/categories_widget.dart';
import 'package:socofrais/presenter/widgets/containers_products/containers_products.dart';
import 'package:socofrais/presenter/widgets/searchBarWidget/search_bar_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              const SearchBarWidget(),
              const SizedBox(height: 10),
              const CarouselWidget(),
              const SizedBox(height: 20),
              const CategorieWidget(),
              const SizedBox(height: 20),
              ContainerProductWidget(
                product:
                    Product(name: '', description: '', price: 0, image: ''),
              ),
              // NavBottomWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
