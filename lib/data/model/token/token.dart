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
    if(balance == "0") return "$balance";
    var length =  balance!.length - int.parse("$decimals");
    var value = balance;
    if(length <= 0){
      var size = length.abs() + 1;
      for(var i = 0; i< size; i++){
        value = "0" + value!;
        length++;
      }
    }
    return balance!.substring(length).length > Const.REMAINDER ?
    StringUtils.addCharAtPosition(value!.substring(0,length + Const.REMAINDER), ".", length) :
    StringUtils.addCharAtPosition(value!, ".", length);
  }

  Token(this.balance, this.contractAddress, this.decimals, this.symbol, this.type);

  factory Token.fromJson(Map<String, dynamic> json) => _$TokenFromJson(json);

  Map<String, dynamic> toJson() => _$TokenToJson(this);

  factory Token.fromBalance(String? balance){
    return Token(balance, "", Const.DECIMAL.toString(), Const.DEFAULT_SYMBOL, "");
  }

  factory Token.fromContract(Contract? contract){
    return Token("0","",contract?.decimals,contract?.symbol,"");
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
