import 'package:base_source/app/base/base_viewmodel.dart';
import 'package:base_source/app/feature/recipe_feed/views/recipe_feed_screen.dart';
import 'package:base_source/app/utils/log.dart';
import 'package:base_source/data/recipe/recipe_feed_repository.dart';
import 'package:get/get.dart';

class RecipeViewModel extends BaseViewModel {
  final RecipeFeedRepository _recipeFeedRepository;
  final List<RecipeFeedModel> _reipeFeeds = [];
  final _currentPage = 0.obs;

  get currentPage => _currentPage;

  List<RecipeFeedModel> get reipeFeeds => _reipeFeeds;

  RecipeViewModel(this._recipeFeedRepository) {
    loadRecipeFeeds();
  }

  loadRecipeFeeds() async {
    change(null, status: RxStatus.loading());
    var response = await _recipeFeedRepository.getAllRecipeFeed();
    if (response.isSuccess) {
      _setRecipeFeedsSucces(response.data);
    } else if (response.isFailure) {
      var error = response.error;
      if (error is APIFailure) {
        _setRecipeFeedsError(error.errorResponse);
      }
    } else {}
  }

  _setRecipeFeedsError(error) {
    change("_photoError", status: RxStatus.error(error));
  }

  _setRecipeFeedsSucces(List<RecipeFeedModel>? data) {
    if (data != null && data.isNotEmpty) {
      _reipeFeeds.addAll(data);
      change(_reipeFeeds, status: RxStatus.success());
    } else {
      log("RecipeScreen",
          mess: "#_setRecipeFeedsSucces()  data null or empty", error: "$data");
    }
  }

  void setCurrentPage(int currentPage) {
    _currentPage.value = currentPage;
  }
}
