import 'package:base_source/app/feature/splash/viewmodels/splash_view_model.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashViewModel>(() => SplashViewModel());
  }
}