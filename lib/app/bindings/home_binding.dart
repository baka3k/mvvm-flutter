import 'package:base_source/app/feature/user/viewmodels/user_view_model.dart';
import 'package:base_source/app/hardware/connection.dart';
import 'package:base_source/data/user/user_repository.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserViewModel>(() => UserViewModel(UserRepositoryImpl(UserServices(NetworkInforImpl()))));
  }
}