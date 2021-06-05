import 'package:basic_utils/basic_utils.dart';
import 'package:fuse_minimal_wallet/data/model/baseresponse/base_response.dart';
import 'package:fuse_minimal_wallet/data/model/contract/contract.dart';
import 'package:fuse_minimal_wallet/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'token.g.dart';
@JsonSerializable()
class Token extends BaseResult{

  @JsonKey(name:"balance")
  final String? balance;
  @JsonKey(name:"contractAddress")
  final String? contractAddress;
  @JsonKey(name:"decimals")
  final String? decimals;
  @JsonKey(name:"symbol")
  final String? symbol;
  @JsonKey(name:"type")
  final String? type;

  String get label => "$balanceDecimal $symbol";

  String get balanceDecimal{
    var length =  balance!.length - int.parse("$decimals");
    return balance!.substring(length).length > Const.REMAINDER ?
    StringUtils.addCharAtPosition("${balance!.substring(0,length + Const.REMAINDER)}", ".", length) :
    StringUtils.addCharAtPosition("$balance", ".", length);
  }

  Token(this.balance, this.contractAddress, this.decimals, this.symbol, this.type);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  factory Token.fromBalance(String? balance){
    return Token(balance, "", Const.DECIMAL.toString(), Const.DEFAULT_SYMBOL, "");
  }

  factory Token.fromContract(Contract? contract){
    return Token(contract?.totalSupply,"",contract?.decimals,contract?.symbol,"");
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Token &&
          runtimeType == other.runtimeType &&
          balance == other.balance &&
          symbol == other.symbol;

  @override
  int get hashCode =>
      balance.hashCode ^
      symbol.hashCode;
}
