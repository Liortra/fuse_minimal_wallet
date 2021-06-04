// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fuse_http_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FuseHttpError _$FuseHttpErrorFromJson(Map<String, dynamic> json) {
  return FuseHttpError(
    json['status'] as String,
    json['message'] as String,
  );
}

Map<String, dynamic> _$FuseHttpErrorToJson(FuseHttpError instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };
