import 'package:json_annotation/json_annotation.dart';


part 'test_user_model.g.dart';

@JsonSerializable()
class TestUser   {
  /// 登录token.
  @JsonKey(name: 'user_id', defaultValue: 0)
  num id = 0;

  /// 聊天账号
  @JsonKey(name: 'account')
  String? account;

  /// 用户昵称
  @JsonKey(name: 'nickname')
  String? nickname;


  TestUser();

  factory TestUser.fromJson(Map<String, dynamic> json) => _$TestUserFromJson(json);

  Map<String, dynamic> toJson() => _$TestUserToJson(this);
}
