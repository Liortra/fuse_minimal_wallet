import 'package:fuse_minimal_wallet/data/model/baseresponse/base_response.dart';
import 'package:fuse_minimal_wallet/data/model/contract/contract.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contract_json_response.g.dart';

@JsonSerializable(explicitToJson: true)
class ContractJSONResponse extends BaseResponse<Contract>{

  ContractJSONResponse(String status, Contract? result, String message) : super(status, result, message);

  factory ContractJSONResponse.fromJson(Map<String, dynamic> json) => _$ContractJSONResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ContractJSONResponseToJson(this);

}