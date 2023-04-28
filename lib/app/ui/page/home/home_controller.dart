import 'package:base_flutter_project/extension/object_extensions.dart';
import 'package:base_flutter_project/extension/str_extensions.dart';
import 'package:base_flutter_project/service/app_service.dart';
import 'package:get/get.dart';

import '../../../../net/provider/test_user_provider.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    customPrintInfo("测试打印");
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void getMultiUser() {
    get<TestUserProvider>()
        .getTestUserList()
        .then((value) => {customPrintInfo("用户列表:${value}")});
  }

  void getSingleUser() {
    get<TestUserProvider>().getTestUser().then((value) {
      customPrintInfo("单个用户信息:${value?.toJson()}");
    });
  }
}
