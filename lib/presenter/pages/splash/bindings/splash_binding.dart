import 'package:get/get.dart';
import 'package:socofrais/presenter/pages/home/controllers/home_controller.dart';
import 'package:socofrais/presenter/pages/splash/controllers/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}