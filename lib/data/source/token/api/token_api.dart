import 'package:dio/dio.dart';
import 'package:fuse_minimal_wallet/application/api_configuration.dart';
import 'package:fuse_minimal_wallet/data/model/token/token.dart';
import 'package:fuse_minimal_wallet/data/source/token/api/response/contractreponse/contract_json_response.dart';
import 'package:fuse_minimal_wallet/data/source/token/api/response/tokenreponse/token_json_response.dart';
import 'package:retrofit/http.dart';

part 'token_api.g.dart';

@RestApi(baseUrl: ApiConfiguration.BASE_URL)
abstract class TokenApi {
  factory TokenApi(Dio dio, {String baseUrl}) = _TokenApi;

  @GET("?module=account&action=tokenlist&address={addressHash}")
  Future<TokenJSONResponse> getTokens(@Path("addressHash") String addressHash);

  @GET("?module=token&action=getToken&contractaddress={contractAddressHash}")
  Future<ContractJSONResponse> addToken(@Path("contractAddressHash") String contractAddressHash);
}
