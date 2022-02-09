
import 'package:base_source/app/feature/recipe_feed/viewmodels/recipe_view_model.dart';
import 'package:base_source/app/hardware/connection.dart';
import 'package:base_source/data/repository.dart';
import 'package:get/get.dart';

class RecipeFeedsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RecipeViewModel>(() => RecipeViewModel(RecipeFeedRepositoryImpl(RecipeService(NetworkInforImpl()))));
  }
}