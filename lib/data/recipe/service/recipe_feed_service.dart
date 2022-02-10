import 'package:base_source/app/hardware/connection.dart';
import 'package:base_source/data/base/base_service.dart';
import 'package:base_source/data/recipe/model/recipe_feed_model.dart';

import '../../base/data_result.dart';

class RecipeService extends BaseService {
  RecipeService(NetworkInfor networkInfor) : super(networkInfor);

  Future<DataResult<List<RecipeFeedModel>>> getRecipes() async {
    try {
      // for test
      return httpGet("https://picsum.photos/v2/list?page=1&limit=100", recipeFeedModelFromJson);
      // return httpGet("https://picsum.photos/v2/list", recipeFeedModelFromJson);
      //var data = RecipeFeedModel(code: 1,message: ""); // dummy data for test
      //return DataResult.success([data]);
    } catch (exception) {
      return getError(exception);
    }
  }
}
