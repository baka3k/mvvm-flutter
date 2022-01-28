import 'dart:async';
import 'dart:io';

import 'package:base_source/app/hardware/connection.dart';
import 'package:base_source/data/base/data_result.dart';
import 'package:base_source/data/base/service_state.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

const timeOutMess = "Time out";
const timeOutDuration = Duration(seconds: 10);

abstract class BaseService extends GetConnect {
  final NetworkInfor _networkInfor;

  BaseService(this._networkInfor);

  Future<DataResult<T>> httpGet<T>(String url, jsonParseFunc,
      {Map<String, String>? headers}) async {
    print("BaseService #httpGet() $url");
    var network = await _networkInfor.isNetworkConnected();
    if (network) {
      var response = await get(url, headers: headers).timeout(timeOutDuration);
      print("BaseService #httpGet() StatusCode: ${response.statusCode} || ResponseData: ${response.bodyString}");
      if (response.bodyString == null || response.bodyString!.isEmpty) {
        return DataResult.failure(
            APIFailure(invalidResponse, 'Invalid Response'));
      }
      var data =
          await compute(jsonParseFunc, response.bodyString ?? ""); // compute
      return DataResult.success(data);
    } else {
      return DataResult.failure(APIFailure(noInternet, 'No Internet Connection'));
    }
  }

  DataResult<T> getError<T>(exception) {
    print("BaseService #getError() $exception");
    if (exception is HttpException) {
      return DataResult.failure(
          APIFailure(noInternet, 'No Internet Connection'));
    } else if (exception is TimeoutException) {
      return DataResult.failure(APIFailure(timeOut, 'Time out'));
    } else if (exception is SocketException) {
      return DataResult.failure(
          APIFailure(noInternet, 'No Internet Connection'));
    } else if (exception is FormatException) {
      return DataResult.failure(APIFailure(invalidFormat, 'Invalid Format'));
    } else {
      return DataResult.failure(exception is Failure
          ? exception
          : APIFailure(unknownError, "Unknow error"));
    }
  }
}
