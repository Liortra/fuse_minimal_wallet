// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_json_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenJSONResponse _$TokenJSONResponseFromJson(Map<String, dynamic> json) {
  return TokenJSONResponse(
    json['status'] as String,
    (json['result'] as List<dynamic>?)
        ?.map((e) => Token.fromJson(e as Map<String, dynamic>))
        .toList(),
    json['message'] as String,
  );
}

Map<String, dynamic> _$TokenJSONResponseToJson(TokenJSONResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'result': instance.result?.map((e) => e.toJson()).toList(),
      'message': instance.message,
    };
