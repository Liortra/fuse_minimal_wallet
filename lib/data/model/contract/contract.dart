
import 'package:fuse_minimal_wallet/data/model/baseresponse/base_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'contract.g.dart';
@JsonSerializable()
class Contract extends BaseResult {

  @JsonKey(name:"cataloged")
  final bool? cataloged;
  @JsonKey(name:"contractAddress")
  final String? contractAddress;
  @JsonKey(name:"decimals")
  final String? decimals;
  @JsonKey(name:"name")
  final String? name;
  @JsonKey(name:"symbol")
  final String? symbol;
  @JsonKey(name:"totalSupply")
  final String? totalSupply;
  @JsonKey(name:"type")
  final String? type;

  Contract(this.cataloged,this.contractAddress,this.decimals,this.name,this.symbol,this.totalSupply,this.type);

  factory Contract.fromJson(Map<String, dynamic> json) => _$ContractFromJson(json);

  Map<String, dynamic> toJson() => _$ContractToJson(this);
}