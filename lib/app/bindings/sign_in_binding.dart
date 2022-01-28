import 'package:base_source/app/feature/signin/viewmodels/sign_in_view_model.dart';
import 'package:base_source/app/hardware/connection.dart';
import 'package:base_source/data/account/account_repository.dart';
import 'package:base_source/data/account/service/account_service.dart';
import 'package:get/get.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignInViewModel>(() => SignInViewModel(AccountRepositoryImpl(AccountServices(NetworkInforImpl()))));
  }
}