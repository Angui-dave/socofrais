import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:socofrais/domain/entities/product.dart';
import 'package:socofrais/presenter/pages/details/controllers/detail_controller.dart';
import 'package:socofrais/presenter/pages/paiement/views/paiement_view.dart';

class DetailView extends GetView<DetailController> {
  final Product product;

  void navigateToPaymentPage() {
    Get.to(() => PaymentView(
          products: [product],
          totalPrice: controller.totalPrice,
        ));
  }

  const DetailView({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DetailController(product: product));
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 310,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(product.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                  // boxShadow: const [
                  //   BoxShadow(
                  //     blurRadius: 0.1,
                  //     spreadRadius: 0.4),
                  // ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 18,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        RatingBar.builder(
                          itemSize: 25,
                          initialRating: 3,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        const SizedBox(width: 8),
                        Text('(${product.reviewCount})')
                      ],
                    ),
                    const SizedBox(height: 18),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Text('Quantité (Nbre de Kg)'),
                        Row(
                          children: [
                            IconButton(
                              onPressed: controller.incrementQuantity,
                              icon: const Icon(Icons.add),
                            ),
                            const SizedBox(width: 2),
                            Obx(() =>
                                Text('(${controller.quantity.value} Kg)')),
                            const SizedBox(width: 2),
                            IconButton(
                              onPressed: controller.decrementQuantity,
                              icon: const Icon(Icons.remove),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 18),
                    DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          const TabBar(
                            indicatorColor: Colors.red,
                            labelColor: Colors.black,
                            overlayColor: MaterialStatePropertyAll(Colors.red),
                            tabs: [
                              Tab(text: 'Description'),
                              Tab(text: 'Commentaires'),
                            ],
                          ),
                          SizedBox(height: 18),
                          SizedBox(
                            height: 200, // Ajustez la hauteur selon vos besoins
                            child: TabBarView(
                              children: [
                                // Contenu de la description
                                Text(
                                  product.description,
                                  style: const TextStyle(fontSize: 14),
                                ),
                                // Contenu des reviews
                                const Text(
                                    'Ici, vous pouvez afficher les commentaires du produit.'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 239, 234, 234),
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 6.5,
              blurRadius: 10.5,
              offset: const Offset(3, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Indicateur de prix total
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Total: ${product.price} F',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            // Bouton "Acheter"
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ElevatedButton(
                onPressed: () {
                  navigateToPaymentPage();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Acheter',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
