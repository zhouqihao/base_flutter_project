// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..code = $enumDecodeNullable(_$ResponseCodeEnumMap, json['code']) ??
      ResponseCode.success
  ..msg = json['msg'] as String?
  ..data = json['data'];

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'code': _$ResponseCodeEnumMap[instance.code]!,
      'msg': instance.msg,
      'data': instance.data,
    };

const _$ResponseCodeEnumMap = {
  ResponseCode.success: 0,
  ResponseCode.success200: 200,
  ResponseCode.error404: 404,
};
