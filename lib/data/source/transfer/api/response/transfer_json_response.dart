import 'package:fuse_minimal_wallet/data/model/baseresponse/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:fuse_minimal_wallet/data/model/transfer/transfer.dart';

part 'transfer_json_response.g.dart';

@JsonSerializable(explicitToJson: true)
class TransferJSONResponse extends BaseListResponse<List<Transfer>> {

  TransferJSONResponse(String status,
      List<Transfer>? result,
      String message)
      : super(status, result, message);

  factory TransferJSONResponse.fromJson(Map<String, dynamic> json) => _$TransferJSONResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransferJSONResponseToJson(this);
}
