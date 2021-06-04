import 'package:dio/dio.dart';
import 'package:fuse_minimal_wallet/data/model/fusehttperror/fuse_http_error.dart';

class ErrorHttpInterceptor extends Interceptor {

  static const _STATUS_OK = "1";

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    final body = response.data;
    try{
      final status = body["status"] as String?;
      if(status == _STATUS_OK) return super.onResponse(response, handler);
      throw FuseHttpError.fromJson(body);
    } catch(e){
      throw e;
    }
  }
}

