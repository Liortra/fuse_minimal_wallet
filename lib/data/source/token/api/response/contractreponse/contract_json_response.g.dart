// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_json_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractJSONResponse _$ContractJSONResponseFromJson(Map<String, dynamic> json) {
  return ContractJSONResponse(
    json['status'] as String,
    json['result'] == null
        ? null
        : Contract.fromJson(json['result'] as Map<String, dynamic>),
    json['message'] as String,
  );
}

Map<String, dynamic> _$ContractJSONResponseToJson(
        ContractJSONResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.toJson(),
      'message': instance.message,
    };
