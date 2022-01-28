import 'package:base_source/app/feature/photo/viewmodels/photo_list_view_model.dart';
import 'package:base_source/app/hardware/connection.dart';
import 'package:base_source/data/photo/photo_repository.dart';
import 'package:base_source/data/photo/service/photo_service.dart';
import 'package:get/get.dart';

class PhotoListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PhotoListViewModel>(
        () => PhotoListViewModel(PhotoRepositoryImp(PhotoService(NetworkInforImpl()))));
  }
}
