library recipe_feed_data;
export '../base/data_result.dart';
export 'model/recipe_feed_model.dart';
export 'service/recipe_feed_service.dart';

import '../base/data_result.dart';
import 'model/recipe_feed_model.dart';
import 'service/recipe_feed_service.dart';

abstract class RecipeFeedRepository {
  Future<DataResult<RecipeFeedModel>> getAllRecipeFeed();
}
class RecipeFeedRepositoryImpl implements RecipeFeedRepository {
  final RecipeService _recipeService;

  RecipeFeedRepositoryImpl(this._recipeService);

  @override
  Future<DataResult<RecipeFeedModel>> getAllRecipeFeed() {
    return _recipeService.getRecipes();
  }
}

