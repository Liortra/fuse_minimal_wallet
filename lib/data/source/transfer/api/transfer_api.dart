import 'package:fuse_minimal_wallet/data/model/transfer/transfer.dart';
import 'package:fuse_minimal_wallet/data/source/transfer/api/response/transfer_json_response.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:fuse_minimal_wallet/application/api_configuration.dart';

part 'transfer_api.g.dart';

@RestApi(baseUrl: ApiConfiguration.BASE_URL)
abstract class TransferApi {
  factory TransferApi(Dio dio, {String baseUrl}) = _TransferApi;

  @GET("?module=account&action=tokentx&address={addressHash}")
  Future<TransferJSONResponse> getTransfers(@Path("addressHash") String addressHash);
}
