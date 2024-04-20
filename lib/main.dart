import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socofrais/presenter/pages/splash/bindings/splash_binding.dart';
import 'package:socofrais/routes/app_pages.dart';

void main() {
  runApp(const AppSocofrais());
}

class AppSocofrais extends StatelessWidget {
  const AppSocofrais({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      initialRoute: AppPages.init,
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
      theme: ThemeData(
        fontFamily: 'Ubuntu',
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
    );
  }
}
