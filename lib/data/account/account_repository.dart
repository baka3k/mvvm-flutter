import 'package:base_source/data/account/model/account_model.dart';
import 'package:base_source/data/account/service/account_service.dart';
import 'package:base_source/data/base/data_result.dart';

abstract class AccountRepository {
  Future<DataResult<AccountModel>> signIn(String userName, String password);
}

class AccountRepositoryImpl implements AccountRepository {
  final AccountServices _accountServices;

  AccountRepositoryImpl(this._accountServices);

  @override
  Future<DataResult<AccountModel>> signIn(String userName, String password) async {
    return _accountServices.signIn(userName, password);
  }
}