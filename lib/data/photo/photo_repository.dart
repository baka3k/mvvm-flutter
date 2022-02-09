library photo_data;
export '../base/data_result.dart';
export 'model/photo_list_model.dart';
export 'service/photo_service.dart';

import '../base/data_result.dart';
import 'model/photo_list_model.dart';
import 'service/photo_service.dart';

abstract class PhotoRepository {
  Future<DataResult<List<Photo>>> getPhotos();
}

class PhotoRepositoryImp implements PhotoRepository {
  final PhotoService _photoService;

  PhotoRepositoryImp(this._photoService);

  @override
  Future<DataResult<List<Photo>>> getPhotos() {
    return _photoService.getPhotos();
  }
}
