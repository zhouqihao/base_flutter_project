import 'dart:async';

import 'package:base_flutter_project/sql/model/test_user_model.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';

import 'base/base_repository.dart';

class TestUserRepository extends BaseRepository {
  ///查询
  Future<TestUserModel?> query({required int userId, required String loginId}) {
    return isar?.testUserModels
            .filter()
            .userIdEqualTo(userId)
            .loginIdEqualTo(loginId)
            .findFirst() ??
        Future.value(null);
  }

  ///计算数量
  Future<int?> count({required String loginId}) {
    return isar?.testUserModels.filter().loginIdEqualTo(loginId).count() ??
        Future.value(0);
  }

  /// 保存或者修改
  ///
  Future<int?> save({required TestUserModel model}) async {
    return isar?.writeTxn(() async {
      ///先找到对应的删除调
      int? value = await isar?.testUserModels
          .filter()
          .userIdEqualTo(model.userId)
          .loginIdEqualTo(model.loginId)
          .deleteAll();

      return isar?.testUserModels.put(model);
      // return value;
    });
  }

//多条件查询
// QueryBuilder<MediaModel, MediaModel, QAfterFilterCondition>? _builder = isar
//     ?.mediaModels
//     .filter()
//     .fileTypeEqualTo(MFileType.file)
//     .loginIdEqualTo(loginId);
//
// ///查询对象不为空，查询指定对象下面的
// if ((targetId ?? "").isNotEmpty) {
// _builder = _builder?.targetIdEqualTo(targetId);
// }
//
// ///文件状态不为空的话
// if (fileStatus != null) {
// if (hasSend != null) {
// _builder = _builder?.group((q) => q
//     .fileStatusEqualTo(fileStatus)
//     .or()
//     .directionEqualTo(MFileDirection.send));
// } else {
// _builder = _builder?.fileStatusEqualTo(fileStatus);
// }
// }
//
// return _builder
//     ?.sortByAddTimeDesc()
//     .offset((pageNo - 1) * pageNum)
//     .limit(pageNum)
//     .findAll() ??
}
