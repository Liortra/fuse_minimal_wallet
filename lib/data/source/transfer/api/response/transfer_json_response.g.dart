// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_json_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferJSONResponse _$TransferJSONResponseFromJson(Map<String, dynamic> json) {
  return TransferJSONResponse(
    json['status'] as String,
    (json['result'] as List<dynamic>?)
        ?.map((e) => Transfer.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['message'] as String,
  );
}

Map<String, dynamic> _$TransferJSONResponseToJson(
        TransferJSONResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.map((e) => e.toJson()).toList(),
      'message': instance.message,
    };
