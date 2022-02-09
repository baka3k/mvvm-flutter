import 'package:base_source/app/hardware/connection.dart';
import 'package:base_source/data/base/base_service.dart';
import 'package:base_source/data/recipe/model/recipe_feed_model.dart';

import '../../base/data_result.dart';

class RecipeService extends BaseService {
  RecipeService(NetworkInfor networkInfor) : super(networkInfor);

  Future<DataResult<RecipeFeedModel>> getRecipes() async {
    try {
      // return
      //   httpGet("https://jsonplaceholder.typicode.com/users", accountModelFromJson);
      var data = RecipeFeedModel(); // dummy data for test
      return DataResult.success(data);
    } catch (exception) {
      return getError(exception);
    }
  }
}
