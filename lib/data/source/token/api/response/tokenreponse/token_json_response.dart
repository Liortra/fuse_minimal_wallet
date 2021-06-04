import 'package:fuse_minimal_wallet/data/model/baseresponse/base_response.dart';
import 'package:fuse_minimal_wallet/data/model/token/token.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token_json_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TokenJSONResponse extends BaseListResponse<List<Token>> {

  TokenJSONResponse(String status,
      List<Token>? result,
      String message)
      : super(status, result, message);

  factory TokenJSONResponse.fromJson(Map<String, dynamic> json) => _$TokenJSONResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TokenJSONResponseToJson(this);
}
