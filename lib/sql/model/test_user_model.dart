import 'package:isar/isar.dart';

import 'base/base_repository.dart';


part 'test_user_model.g.dart';

//// 简单的用户信息库，只做保存昵称和头像，响应收到消息时的用户信息
@Collection(ignore: {'aaa'})
class TestUserModel extends BaseSqlModel {
  Id id = Isar.autoIncrement;

  /// 所属聊天对象的ID
  @Index(unique: true)
  int? userId;

  String? avatar;

  String? nickname;

  bool aaa = true;
}
