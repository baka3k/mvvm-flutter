import 'package:base_source/app/feature/user/viewmodels/user_detail_view_model.dart';
import 'package:base_source/app/hardware/connection.dart';
import 'package:base_source/data/user/service/user_service.dart';
import 'package:base_source/data/user/user_repository.dart';
import 'package:get/get.dart';

class UserDetailBinding extends Bindings {
  @override
  void dependencies() {
     Get.lazyPut<UserDetailViewModel>(() => UserDetailViewModel(UserRepositoryImpl(UserServices(NetworkInforImpl()))));
  }
}