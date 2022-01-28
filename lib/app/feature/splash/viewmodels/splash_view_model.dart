import 'dart:async';
import 'package:get/get.dart';
import 'package:base_source/app/base/base_viewmodel.dart';

class SplashViewModel extends BaseViewModel {
  final RxBool _moveToNextScreen = RxBool(false);

  RxBool get moveToNextScreen => _moveToNextScreen;

  SplashViewModel() {
    startDelayTime();
  }

  Timer? _timer;

  startDelayTime() {
    _moveToNextScreen.value = false;
    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 3), () {
      gotoNextScreen();
    });
  }

  gotoNextScreen() {
    _moveToNextScreen.value = true;
  }
}
