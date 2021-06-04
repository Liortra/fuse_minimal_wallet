// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance_json_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BalanceJSONResponse _$BalanceJSONResponseFromJson(Map<String, dynamic> json) {
  return BalanceJSONResponse(
    json['status'] as String,
    json['result'] as String?,
    json['message'] as String,
  );
}

Map<String, dynamic> _$BalanceJSONResponseToJson(
        BalanceJSONResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result,
      'message': instance.message,
    };
