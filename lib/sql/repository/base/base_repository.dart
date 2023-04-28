import 'package:base_flutter_project/sql/model/test_user_model.dart';
import 'package:get/get.dart';
import 'package:isar/isar.dart';


class BaseRepository extends GetxService {
  Isar? get isar => GetInstance().find<IsarRepository>().appIsar;
}

class IsarRepository extends GetxService {
  Isar? appIsar;

  @override
  void onInit() {
    super.onInit();
    appIsar = Isar.openSync([TestUserModelSchema]);
  }

  @override
  void onClose() {
    appIsar?.close();
  }
}
