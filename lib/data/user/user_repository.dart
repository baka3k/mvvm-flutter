import 'package:base_source/data/base/data_result.dart';
import 'package:base_source/data/user/model/users_list_model.dart';
import 'package:base_source/data/user/service/user_service.dart';

abstract class UserRepository {
  Future<DataResult<List<UserModel>>> getUsers();
}

class UserRepositoryImpl implements UserRepository {
  final UserServices _userServices;

  UserRepositoryImpl(this._userServices);

  @override
  Future<DataResult<List<UserModel>>> getUsers() {
    return _userServices.getUsers();
    // return _userServices.getUsers();
  }
}
