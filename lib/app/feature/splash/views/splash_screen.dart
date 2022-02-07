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
    return LayoutBuilder(builder: (context, contrains) {
      return Stack(
        children: [
          Image.asset(
            "assets/images/sign_in_bg_scratch_ui.jpg",
            fit: BoxFit.fitWidth,
            width: double.infinity,
          ),
          Positioned(
            top: contrains.maxHeight * 0.4,
            left: contrains.maxWidth * 0.35,
            child: Image.asset(
              "assets/images/scratch_logo.png",
              width: contrains.maxWidth * 0.25,
            ),
          ),
        ],
      );
    });
  }

  gotoNextScreen() {
    // offAllNamed clean SplashScreen from memory
    Get.offAllNamed(Routes.SIGN_IN);
  }
}
