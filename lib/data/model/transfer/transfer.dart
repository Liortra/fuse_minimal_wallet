import 'package:basic_utils/basic_utils.dart';
import 'package:fuse_minimal_wallet/data/model/baseresponse/base_response.dart';
import 'package:fuse_minimal_wallet/utils/utils.dart';
import 'package:json_annotation/json_annotation.dart';
part 'transfer.g.dart';


@JsonSerializable()
class Transfer extends BaseResult {

  @JsonKey(name:"blockHash")
  final String? blockHash;
  @JsonKey(name:"blockNumber")
  final String? blockNumber;
  @JsonKey(name:"confirmations")
  final String? confirmations;
  @JsonKey(name:"contractAddress")
  final String? contractAddress;
  @JsonKey(name:"cumulativeGasUsed")
  final String? cumulativeGasUsed;
  @JsonKey(name:"from")
  final String? from;
  @JsonKey(name:"gas")
  final String? gas;
  @JsonKey(name:"gasPrice")
  final String? gasPrice;
  @JsonKey(name:"gasUsed")
  final String? gasUsed;
  @JsonKey(name:"hash")
  final String? hash;
  @JsonKey(name:"input")
  final String? input;
  @JsonKey(name:"logIndex")
  final String? logIndex;
  @JsonKey(name:"nonce")
  final String? nonce;
  @JsonKey(name:"timeStamp")
  final String? timeStamp;
  @JsonKey(name:"to")
  final String? to;
  @JsonKey(name:"tokenDecimal")
  final String? tokenDecimal;
  @JsonKey(name:"tokenName")
  final String? tokenName;
  @JsonKey(name:"tokenSymbol")
  final String? tokenSymbol;
  @JsonKey(name:"transactionIndex")
  final String? transactionIndex;
  @JsonKey(name:"value")
  final String? value;

  String get label => "$transferDecimal $tokenSymbol";

  String get transferDecimal{
    var length =  value!.length - int.parse("$tokenDecimal");
    return value!.substring(length).length > Const.REMAINDER ?
      StringUtils.addCharAtPosition("${value!.substring(0,length + Const.REMAINDER)}", ".", length) :
    StringUtils.addCharAtPosition("$value", ".", length);
  }

  Transfer(
      this.blockHash,
      this.blockNumber,
      this.confirmations,
      this.contractAddress,
      this.cumulativeGasUsed,
      this.from,
      this.gas,
      this.gasPrice,
      this.gasUsed,
      this.hash,
      this.input,
      this.logIndex,
      this.nonce,
      this.timeStamp,
      this.to,
      this.tokenDecimal,
      this.tokenName,
      this.tokenSymbol,
      this.transactionIndex,
      this.value);

  factory Transfer.fromJson(Map<String, dynamic> json) => _$TransferFromJson(json);



  Map<String, dynamic> toJson() => _$TransferToJson(this);
}


