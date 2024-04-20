import 'package:get/get.dart';
import 'package:socofrais/presenter/pages/auth/login/controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => LoginController());
  }
}

