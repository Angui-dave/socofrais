import 'package:get/get.dart';
import 'package:socofrais/presenter/pages/valide_paiement/controllers/valide_pmt_controller.dart';

class ValidePaiementBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => ValidePaiementController());
  }
}