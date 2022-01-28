import 'package:base_source/app/hardware/connection.dart';
import 'package:base_source/data/base/base_service.dart';
import 'package:base_source/data/base/data_result.dart';
import 'package:base_source/data/photo/model/photo_list_model.dart';

class PhotoService extends BaseService {
  PhotoService(NetworkInfor networkInfor) : super(networkInfor);

  Future<DataResult<List<Photo>>> getPhotos() async {
    try {
      return httpGet("https://jsonplaceholder.typicode.com/photos",
          photoListModelFromJson);
    } catch (exception) {
      return getError<List<Photo>>(exception);
    }
  }
// Future<DataResult<List<Photo>>> getPhotos() async {
//   try {
//     var response = await httpGet("https://jsonplaceholder.typicode.com/photos",photoListModelFromJson);
//     if (success == response.statusCode) {
//       if (response.bodyString == null || response.bodyString!.isEmpty) {
//         return DataResult.failure(APIFailure(invalidResponse, 'Invalid Response'));
//       }
//       var data = await compute(photoListModelFromJson, response.bodyString ?? "");
//       return DataResult.success(data);
//     }
//     return DataResult.failure(APIFailure(invalidResponse, 'Invalid Response'));
//   } catch (exception) {
//     return getError<List<Photo>>(exception);
//   }
// }
}
