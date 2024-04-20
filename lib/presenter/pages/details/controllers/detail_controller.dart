import 'package:get/get.dart';
import 'package:socofrais/domain/entities/product.dart';

class DetailController extends GetxController {

final Product product;
  final quantity = 1.obs;
  double totalPrice = 0; // Initialisation avec une valeur par défaut

  DetailController({required this.product});

  void incrementQuantity() {
    quantity.value++;
    calculateTotalPrice();
  }

  void decrementQuantity() {
    if (quantity.value > 1) {
      quantity.value--;
      calculateTotalPrice();
    }
  }

  double calculateTotalPrice() {
  totalPrice = product.price * quantity.value;
  return totalPrice;
}


  // final Product product;
  // final quantity = 1.obs;

  // DetailController({required this.product});

  // void incrementQuantity() {
  //   quantity.value++;
  // }

  // void decrementQuantity() {
  //   if (quantity.value > 1) {
  //     quantity.value--;
  //   }
  // }

  // double get totalPrice => product.price * quantity.value;

  List<Product> productList = [
    Product(
        description: 'Avocat de qualité',
        name: 'Avocat',
        price: 1000,
        image: 'images/avocat.jpeg',
        rating: 3,
        reviewCount: 70),
    Product(
        description: 'Profitez de notre coffret de fruits et legumes',
        name: 'Coffret de fruit',
        price: 3500,
        image: 'images/image1.jpeg',
        rating: 3,
        reviewCount: 80),
    Product(
        description: 'Bon choux pour vos plats',
        name: 'Choux ',
        price: 4000,
        image: 'images/choux.jpeg',
        rating: 3,
        reviewCount: 52),
    Product(
        description: 'Bonne viande de boeuf',
        name: 'Viande de boeuf',
        price: 2500,
        image: 'images/viande-b.jpeg',
        rating: 3,
        reviewCount: 56),
    Product(
        description: 'Poulet de chair',
        name: 'Poulet',
        price: 3500,
        image: 'images/poulet1.jpeg',
        rating: 3,
        reviewCount: 34),
    Product(
        description: 'Des cuisses de poulet de qualité',
        name: 'cuisse de poulet',
        price: 1000,
        image: 'images/cuisse-poulet.jpeg',
        rating: 3,
        reviewCount: 36),
    Product(
        description: 'Bonne viande de boeuf pour vos plat',
        name: 'Viande de boeuf',
        price: 2500,
        image: 'images/viandeb2.jpeg',
        rating: 3,
        reviewCount: 50),
    Product(
        description: 'Les meilleures qualités de feuille d\'epinard',
        name: 'Feuille d\'epinard',
        price: 1500,
        image: 'images/epinard.jpeg',
        rating: 3,
        reviewCount: 40),
    Product(
        description: 'Bonne viande de boeuf pour vos plat',
        name: 'Viande de boeuf',
        price: 2500,
        image: 'images/viandeb3.jpeg',
        rating: 3,
        reviewCount: 90),
    Product(
        description: 'Les oignon violet de qualité',
        name: 'Oignon',
        price: 2500,
        image: 'images/oignon1.jpeg',
        rating: 3,
        reviewCount: 34),
  ];
}
