import 'package:fuse_minimal_wallet/data/model/baseresponse/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
part 'balance_json_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BalanceJSONResponse extends BaseResponsePrimitive<String>{
 
  BalanceJSONResponse(String status, String? result, String message) : super(status, result, message);

  factory BalanceJSONResponse.fromJson(Map<String, dynamic> json) => _$BalanceJSONResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BalanceJSONResponseToJson(this);
  
}