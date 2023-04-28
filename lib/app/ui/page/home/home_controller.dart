import 'package:base_flutter_project/extension/object_extensions.dart';
import 'package:base_flutter_project/extension/str_extensions.dart';
import 'package:base_flutter_project/service/app_service.dart';
import 'package:get/get.dart';

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
}
