import 'package:base_flutter_project/net/provider/test_user_provider.dart';
import 'package:base_flutter_project/service/app_service.dart';
import 'package:base_flutter_project/sql/repository/test_user_repository.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

import '../../sql/repository/base/base_repository.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    ///app绑定数据一定按照这个规则，否则当你服务需要请求网络时经常出问题
    ///
    ///绑定数据库相关的
    Get.put(IsarRepository());
    Get.put(TestUserRepository());

    ///绑定网络请求
    Get.put(TestUserProvider());

    ///用来绑定服务
    Get.put(AppService());
  }
}
