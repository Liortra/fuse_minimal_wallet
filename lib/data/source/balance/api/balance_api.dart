import 'package:fuse_minimal_wallet/application/api_configuration.dart';
import 'package:fuse_minimal_wallet/data/source/balance/api/response/balance_json_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'balance_api.g.dart';

@RestApi(baseUrl: ApiConfiguration.BASE_URL)
abstract class BalanceApi {
  factory BalanceApi(Dio dio, {String baseUrl}) = _BalanceApi;

  @GET("?module=account&action=balance&address={addressHash}")
  Future<BalanceJSONResponse> getBalance(@Path("addressHash") String addressHash);
}
