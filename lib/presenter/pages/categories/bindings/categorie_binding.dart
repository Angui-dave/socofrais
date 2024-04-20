import 'package:get/get.dart';
import 'package:socofrais/presenter/pages/categories/controllers/categorie_controller.dart';

class CategorieBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => CategorieController());
  }
}