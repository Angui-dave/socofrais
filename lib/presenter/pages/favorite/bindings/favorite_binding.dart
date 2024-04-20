import 'package:get/get.dart';
import 'package:socofrais/presenter/pages/favorite/controllers/favorite_controller.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => FavoriteController());
  }
}