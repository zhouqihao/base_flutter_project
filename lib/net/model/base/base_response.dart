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


@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'code', defaultValue: ResponseCode.success)
  ResponseCode code = ResponseCode.success;

  @JsonKey(name: 'msg', includeIfNull: true)
  String? msg;

  @JsonKey(name: NetConfig.dataName, includeIfNull: true)
  dynamic data;

  BaseResponse();

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
