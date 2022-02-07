import '../base/data_result.dart';
import 'model/account_model.dart';

abstract class AccountRepository {
  Future<DataResult<AccountModel>> signIn(String userName, String password);
}

class AccountRepositoryImpl implements AccountRepository {
  final AccountServices _accountServices;

  AccountRepositoryImpl(this._accountServices);

  @override
  Future<DataResult<AccountModel>> signIn(
      String userName, String password) async {
    return _accountServices.signIn(userName, password);
  }
}
