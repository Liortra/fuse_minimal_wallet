import 'package:flutter/foundation.dart';
import 'package:fuse_minimal_wallet/data/source/balance/api/balance_api.dart';
import 'package:fuse_minimal_wallet/data/source/token/api/token_api.dart';
import 'package:fuse_minimal_wallet/data/source/transfer/api/transfer_api.dart';
import 'package:fuse_minimal_wallet/utils/errorhttpinterceptor/error_http_interceptor.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class NetBindingModule {
  static provideNetModules() {
    _provideDio();
    _provideBalanceApi();
    _provideTokenApi();
    _provideTransferApi();
  }

  static void _provideDio() {
    GetIt.I.registerFactory(() {
      final dio = Dio();
      if (kDebugMode) dio.interceptors.add(PrettyDioLogger(requestBody: true));
      dio.interceptors.add(ErrorHttpInterceptor());
      return dio;
    });
  }

  static void _provideBalanceApi() =>
      GetIt.I.registerFactory(() => BalanceApi(GetIt.I.get()));

  static void _provideTokenApi() =>
      GetIt.I.registerFactory(() => TokenApi(GetIt.I.get()));

  static void _provideTransferApi() =>
      GetIt.I.registerFactory(() => TransferApi(GetIt.I.get()));
}
