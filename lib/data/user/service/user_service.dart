import 'dart:async';

import 'package:base_source/app/hardware/connection.dart';
import 'package:base_source/data/base/base_service.dart';
import 'package:base_source/data/base/data_result.dart';
import 'package:base_source/data/user/model/users_list_model.dart';

class UserServices extends BaseService {
  UserServices(NetworkInfor networkInfor) : super(networkInfor);

  Future<DataResult<List<UserModel>>> getUsers() async {
    try {
      return httpGet("https://jsonplaceholder.typicode.com/users",usersListModelFromJson);
    } catch (exception) {
      return getError(exception);
    }
  }
  // Future<DataResult<List<UserModel>>> getUsers() async {
  //   try {
  //     var response = await httpGet("https://jsonplaceholder.typicode.com/users");
  //     if (success == response.statusCode) {
  //       if (response.bodyString == null || response.bodyString!.isEmpty) {
  //         return DataResult.failure(APIFailure(invalidResponse, 'Invalid Response'));
  //       }
  //       var data = await compute(usersListModelFromJson, response.bodyString ?? ""); // compute
  //       return DataResult.success(data);
  //     }
  //     return DataResult.failure(APIFailure(invalidResponse, 'Invalid Response'));
  //   } catch (exception) {
  //     return getError(exception);
  //   }
  // }
}
