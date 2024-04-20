import 'package:get/get.dart';
import 'package:socofrais/domain/entities/product.dart';
import 'package:socofrais/presenter/pages/details/controllers/detail_controller.dart';

class DetailBindings extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => DetailController(product: Product(name: '', description: '', price: 0, image: '')));
  }
}