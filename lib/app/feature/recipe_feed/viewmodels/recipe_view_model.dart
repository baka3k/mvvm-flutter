import 'package:base_source/app/base/base_viewmodel.dart';
import 'package:base_source/app/feature/recipe_feed/views/recipe_feed.dart';
import 'package:base_source/data/recipe/recipe_feed_repository.dart';
import 'package:get/get.dart';

class RecipeViewModel extends BaseViewModel {
  final RecipeFeedRepository _recipeFeedRepository;
  final List<RecipeFeed> _reipeFeeds = [];

  List<RecipeFeed> get reipeFeeds => _reipeFeeds;

  RecipeViewModel(this._recipeFeedRepository);

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

  _setRecipeFeedsSucces(RecipeFeedModel? data) {
    // _reipeFeeds = data!;
    change(_reipeFeeds, status: RxStatus.success());
  }
}
