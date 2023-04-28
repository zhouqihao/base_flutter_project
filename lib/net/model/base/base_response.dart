import 'package:base_flutter_project/net/net_config.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

enum ResponseCode {
  ///成功
  @JsonValue(0)
  success,

  ///成功
  @JsonValue(200)
  success200,

  /// 维护
  @JsonValue(404)
  error404,
}

@JsonSerializable(genericArgumentFactories: true)
class BaseResponse<T> {
  @JsonKey(name: NetConfig.responseCodeName, defaultValue: ResponseCode.success)
  ResponseCode code = ResponseCode.success;

  @JsonKey(name: NetConfig.responseMsgName, includeIfNull: true)
  String? msg;

  @JsonKey(name: NetConfig.responseDataName, includeIfNull: true)
  T? data;

  BaseResponse();

  factory BaseResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$BaseResponseFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) =>
      _$BaseResponseToJson<T>(this, toJsonT);
}
