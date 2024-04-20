import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socofrais/app/theme/app_colors.dart';
import 'package:socofrais/presenter/pages/auth/login/views/login_view.dart';
import 'package:socofrais/presenter/pages/home/views/home_view.dart';
import 'package:socofrais/presenter/pages/splash/controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () {
      Get.off(() => const LoginView());
    });
    // var controller = Get.find<SplashController>();
    return Scaffold(
      backgroundColor: AppColors.screen,
      body: const Column(
        children: [
          Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 140)),
          Center(
            child: Image(
              image: AssetImage('images/splashScreen.png'),
              width: 200,
              height: 200,
            ),
          ),
          // Text(controller.name),
          SizedBox(height: 180),
          CircularProgressIndicator(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
