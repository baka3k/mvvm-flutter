library account_data;

export '../base/data_result.dart';
export 'model/account_model.dart';
export 'service/account_service.dart';

import '../base/data_result.dart';
import 'model/account_model.dart';
import 'service/account_service.dart';

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
