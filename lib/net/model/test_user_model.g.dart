// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'test_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestUser _$TestUserFromJson(Map<String, dynamic> json) => TestUser()
  ..id = json['user_id'] as num? ?? 0
  ..account = json['account'] as String?
  ..nickname = json['nickname'] as String?;

Map<String, dynamic> _$TestUserToJson(TestUser instance) => <String, dynamic>{
      'user_id': instance.id,
      'account': instance.account,
      'nickname': instance.nickname,
    };
