import 'package:json_annotation/json_annotation.dart';
part 'fuse_http_error.g.dart';

@JsonSerializable()
class FuseHttpError implements Exception {
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "message")
  final String message;

  FuseHttpError(this.status, this.message);

  factory FuseHttpError.fromJson(Map<String, dynamic> json) => _$FuseHttpErrorFromJson(json);

  Map<String, dynamic> toJson() => _$FuseHttpErrorToJson(this);

}
