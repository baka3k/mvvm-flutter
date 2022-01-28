import 'dart:async';

import 'package:base_source/app/base/base_viewmodel.dart';
import 'package:base_source/data/user/model/users_list_model.dart';
import 'package:base_source/data/user/user_repository.dart';

class UserDetailViewModel extends BaseViewModel {
  final UserRepository _userRepository;
  UserModel? _selectedUser;

  UserModel? get selectedUser => _selectedUser;

  @override
  FutureOr<void> init() {}

  UserDetailViewModel(this._userRepository);
  setSelectedUser(UserModel userModel) {
    _selectedUser = userModel;
    print(_selectedUser?.name);
  }
}
