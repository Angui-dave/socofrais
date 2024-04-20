part of './app_pages.dart';

abstract class _Paths { 
  _Paths._();
  static const splashScreen = "/splash";
  static const loginPage = "/login";
  static const registerPage = "/register";
  static const homePage = "/home";
  static const categoriePage = "/categorie";
  static const detailPage = "/detail";
  static const favoritePage = "/favorite";
  static const onboardingPage = "/onboarding";
  static const paiementPage = "/paiement";
  static const panierPage = "/panier";
  static const profilPage = "/profil";
  static const validePaiement = "/valide_paiement";
  
}

abstract class Route {
  Route._();
  static const splashScreen = _Paths.splashScreen;
  static const loginPage = _Paths.loginPage;
  static const registerPage = _Paths.registerPage;
  static const homePage = _Paths.homePage;
  static const categoriePage = _Paths.categoriePage;
  static const detailPage = _Paths.detailPage;
  static const favoritePage = _Paths.favoritePage;
  static const onboardingPage = _Paths.onboardingPage;
  static const paiementPage = _Paths.paiementPage;
  static const panierPage = _Paths.panierPage;
  static const profilPage = _Paths.profilPage;
  static const validePaiement = _Paths.validePaiement;
}


