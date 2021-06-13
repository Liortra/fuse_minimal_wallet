import 'package:basic_utils/basic_utils.dart';
import 'package:fuse_minimal_wallet/data/model/baseresponse/base_response.dart';
import 'package:fuse_minimal_wallet/data/source/user/user_data_source.dart';
import 'package:fuse_minimal_wallet/utils/utils.dart';
import 'package:get_it/get_it.dart';
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

  // Future<String> get label async => "$transferDecimal $tokenSymbol =>  $sendOrReceive";
  String get label => "$transferDecimal $tokenSymbol";

  String get transferDecimal{
    var length =  value!.length - int.parse("$tokenDecimal");
    var balance = value;
    if(length <= 0) {
      var size = length.abs() + 1;
      for (var i = 0; i < size; i++) {
        balance = "0" + balance!;
        length++;
      }
    }
    return value!.substring(length).length > Const.REMAINDER ?
      StringUtils.addCharAtPosition(balance!.substring(0,length + Const.REMAINDER), ".", length) :
    StringUtils.addCharAtPosition(balance!, ".", length);
  }

  // Future<String> get sendOrReceive async{
  //   final _userLocalDataSource = GetIt.I<UserLocalDataSource>();
  //   var status = await _userLocalDataSource.loadUserAddress();
  //   return StringUtils.equalsIgnoreCase(status!, "$from") ? "Receive" : "Sent";
  // }

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


