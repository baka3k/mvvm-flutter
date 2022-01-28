import 'package:base_source/app/components/app_theme.dart';
import 'package:base_source/app/feature/splash/viewmodels/splash_view_model.dart';
import 'package:base_source/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetWidget<SplashViewModel> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _observeScreenState();
    return Scaffold(
      backgroundColor: mainColor,
      body: SafeArea(child: _backgroundPhoto()),
    );
  }

  _observeScreenState() {
    controller.moveToNextScreen.listen((state) {
      if (state) {
        gotoNextScreen();
      }
    });
  }

  _backgroundPhoto() {
    return Image.asset(
      "assets/images/splash.jpg",
      fit: BoxFit.fitWidth,
      width: double.infinity,
    );
  }

  gotoNextScreen() {
    // offAllNamed clean SplashScreen from memory
    Get.offAllNamed(Routes.SIGN_IN);
  }
}
