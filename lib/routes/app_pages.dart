import 'package:get/get.dart';
import 'package:socofrais/domain/entities/product.dart';
import 'package:socofrais/presenter/pages/auth/login/bindings/login_binding.dart';
import 'package:socofrais/presenter/pages/auth/login/views/login_view.dart';
import 'package:socofrais/presenter/pages/auth/register/bindings/register_controller.dart';
import 'package:socofrais/presenter/pages/auth/register/views/register_view.dart';
import 'package:socofrais/presenter/pages/categories/bindings/categorie_binding.dart';
import 'package:socofrais/presenter/pages/categories/views/categorie_view.dart';
import 'package:socofrais/presenter/pages/details/bindings/detail_bindings.dart';
import 'package:socofrais/presenter/pages/details/views/detail_view.dart';
import 'package:socofrais/presenter/pages/favorite/bindings/favorite_binding.dart';
import 'package:socofrais/presenter/pages/favorite/views/favorite_view.dart';
import 'package:socofrais/presenter/pages/home/bindings/home_binding.dart';
import 'package:socofrais/presenter/pages/home/views/home_view.dart';
import 'package:socofrais/presenter/pages/splash/bindings/splash_binding.dart';
import 'package:socofrais/presenter/pages/splash/views/splash_view.dart';
import 'package:socofrais/presenter/pages/valide_paiement/bindings/valide_pmt_binding.dart';
import 'package:socofrais/presenter/pages/valide_paiement/views/valide_pmt_view.dart';
part './app_routes.dart';


abstract class AppPages {
  AppPages._();
  static const init = _Paths.splashScreen;

  static final routes = [
    GetPage(
      name: _Paths.splashScreen,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.homePage,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.loginPage,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.registerPage,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.detailPage,
      page: () =>  DetailView(product: Product(name: '', description: '', price: 0, image: '', rating: 0, reviewCount: 0),),
      binding: DetailBindings(),
    ),
    GetPage(
      name: _Paths.categoriePage,
      page: () => const CategorieView(),
      binding: CategorieBinding(),
    ),
    GetPage(
      name: _Paths.favoritePage,
      page: () => const FavoriteView(),
      binding: FavoriteBinding(),
    ),
    GetPage(
      name: _Paths.validePaiement,
      page: () => const ValidePaiementView(),
      binding: ValidePaiementBinding(),
    ),
  ];
}