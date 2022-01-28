import 'package:base_source/data/base/data_result.dart';
import 'package:base_source/data/photo/model/photo_list_model.dart';
import 'package:base_source/data/photo/service/photo_service.dart';

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
