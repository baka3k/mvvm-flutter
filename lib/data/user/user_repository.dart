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
