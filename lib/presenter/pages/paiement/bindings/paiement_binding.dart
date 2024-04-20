import 'package:get/get.dart';
import 'package:socofrais/presenter/pages/paiement/controllers/paiement_controller.dart';

class PaiementBinding extends Bindings {
  @override
  void dependencies(){
    Get.lazyPut(() => PaiementController());
  }
}