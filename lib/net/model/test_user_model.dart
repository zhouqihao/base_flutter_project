import 'package:json_annotation/json_annotation.dart';


part 'test_user_model.g.dart';

@JsonSerializable()
class TestUserModel  {
  @JsonKey(defaultValue: 0)
  final int account;
  @JsonKey(defaultValue: '')
  final String nickname;
  @JsonKey(name: 'user_id', defaultValue: 0)
  final int userId;

   const TestUserModel({
    required this.account,
    required this.nickname,
    required this.userId,
  });

  factory TestUserModel.fromJson(Map<String, dynamic> json) =>
      _$TestUserModelFromJson(json);

  Map<String, dynamic> toJson() => _$TestUserModelToJson(this);

  TestUserModel copyWith({
    int? account,
    String? nickname,
    int? userId,
  }) {
    return TestUserModel(
      account: account ?? this.account,
      nickname: nickname ?? this.nickname,
      userId: userId ?? this.userId,
    );
  }
}
