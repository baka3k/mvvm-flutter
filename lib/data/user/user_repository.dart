library user_data;

export '../base/data_result.dart';
export 'model/users_list_model.dart';
export 'service/user_service.dart';

import '../base/data_result.dart';
import 'model/users_list_model.dart';
import 'service/user_service.dart';

abstract class UserRepository {
  Future<DataResult<List<UserModel>>> getUsers();
}

class UserRepositoryImpl implements UserRepository {
  final UserServices _userServices;

  UserRepositoryImpl(this._userServices);

  @override
  Future<DataResult<List<UserModel>>> getUsers() {
    return _userServices.getUsers();
  }
}
