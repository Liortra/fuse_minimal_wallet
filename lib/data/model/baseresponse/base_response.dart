import 'package:json_annotation/json_annotation.dart';

abstract class BaseResponsePrimitive<T> {

  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "result")
  final T? result;
  @JsonKey(name: "message")
  final String message;

  BaseResponsePrimitive(this.status, this.result, this.message);
}

abstract class BaseResponse<T extends BaseResult> {

  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "result")
  final T? result;
  @JsonKey(name: "message")
  final String message;

  BaseResponse(this.status, this.result, this.message);
}

///Base list response
/// support result as [List]
abstract class BaseListResponse<T extends List<BaseResult>> {

@JsonKey(name:"status")
final String status;
@JsonKey(name:"result")
final T? result;
@JsonKey(name:"message")
final String message;

BaseListResponse(this.status, this.result, this.message);

}

///
/// BASE RESPONSE
///
abstract class BaseResult {}