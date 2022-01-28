import 'package:base_source/app/feature/map/viewmodels/map_view_model.dart';
import 'package:get/get.dart';

class MapBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MapViewModel>(() => MapViewModel());
  }
}