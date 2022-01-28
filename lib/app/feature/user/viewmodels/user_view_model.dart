import 'dart:async';

import 'package:base_source/app/base/base_viewmodel.dart';
import 'package:base_source/data/base/data_result.dart';
import 'package:base_source/data/user/model/user_error.dart';
import 'package:base_source/data/user/model/users_list_model.dart';
import 'package:base_source/data/user/user_repository.dart';
import 'package:get/get.dart';

class UserViewModel extends BaseViewModel {
  final UserRepository _userRepository;
  List<UserModel> _userListModel = [];

  List<UserModel> get userListModel => _userListModel;

  UserModel? _selectedUser;

  UserModel? get selectedUser => _selectedUser;

  UserError? _userError;

  @override
  FutureOr<void> init() {}

  UserViewModel(this._userRepository) {
    getUsers();
  }

  getUsers() async {
    change(null, status: RxStatus.loading());
    var response = await _userRepository.getUsers();
    if (response.isSuccess) {
      setUserListModel(response.data!);
    } else if (response.isFailure) {
      var error = response.error;
      if (error is APIFailure) {
        UserError userError = UserError(
          code: error.code,
          message: error.errorResponse,
        );
        setUserError(userError);
      }
    }
  }

  setUserError(UserError userError) {
    _userError = userError;
    change(_userError, status: RxStatus.error(userError.message));
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
    change(_userListModel, status: RxStatus.success());
  }

  setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
    print(_selectedUser?.name);
  }

  UserError? get userError => _userError;
}
