import 'dart:async';

import 'package:base_source/app/hardware/connection.dart';
import '../../base/base_service.dart';
import '../../base/data_result.dart';
import '../model/account_model.dart';

class AccountServices extends BaseService {
  AccountServices(NetworkInfor networkInfor) : super(networkInfor);

  Future<DataResult<AccountModel>> signIn(String user, String pass) async {
    try {
      // return
      //   httpGet("https://jsonplaceholder.typicode.com/users", accountModelFromJson);
      var data = AccountModel(code: 100, message: "ok"); // dummy data for test
      return DataResult.success(data);
    } catch (exception) {
      return getError(exception);
    }
  }

  // Future<DataResult<AccountModel>> signIn(String user, String pass) async {
  //   try {
  //     var response =
  //         await httpGet("https://jsonplaceholder.typicode.com/users");
  //     if (success == response.statusCode) {
  //       if (response.bodyString == null || response.bodyString!.isEmpty) {
  //         return DataResult.failure(
  //             APIFailure(invalidResponse, 'Invalid Response'));
  //       }
  //       // var data = await compute(accountModelFromJson, response.bodyString ?? ""); // compute
  //       var data =
  //           AccountModel(code: 100, message: "ok"); // dummy data for test
  //       return DataResult.success(data);
  //     }
  //     return DataResult.failure(
  //         APIFailure(invalidResponse, 'Invalid Response'));
  //   } catch (exception) {
  //     return getError(exception);
  //   }
  // }
}
