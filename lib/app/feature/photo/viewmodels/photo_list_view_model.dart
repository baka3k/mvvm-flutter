import 'package:base_source/app/base/base_viewmodel.dart';
import 'package:base_source/data/base/data_result.dart';
import 'package:base_source/data/photo/model/photo_error.dart';
import 'package:base_source/data/photo/model/photo_list_model.dart';
import 'package:base_source/data/photo/photo_repository.dart';
import 'package:get/get.dart';

class PhotoListViewModel extends BaseViewModel {
  final PhotoRepository _photoRepository;

  PhotoListViewModel(this._photoRepository) {
    getPhotoList();
  }

  List<Photo> _photos = [];

  List<Photo> get photos => _photos;
  PhotoError? _photoError;

  getPhotoList() async {
    change(null, status: RxStatus.loading());
    var response = await _photoRepository.getPhotos();
    if (response.isSuccess) {
      setPhotoListSuccess(response.data);
    } else if (response.isFailure) {
      var error = response.error;
      if (error is APIFailure) {
        PhotoError photoError =
        PhotoError(code: error.code, message: error.errorResponse);
        setPhotoError(photoError);
      }
    }
  }

  setPhotoError(PhotoError photoError) {
    _photoError = photoError;
    change(_photoError, status: RxStatus.error(photoError.message));
  }

  void setPhotoListSuccess(List<Photo>? data) {
    _photos = data!;
    change(_photos, status: RxStatus.success());
  }
}
