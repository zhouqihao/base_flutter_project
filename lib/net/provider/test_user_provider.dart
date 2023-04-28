import 'package:base_flutter_project/extension/object_extensions.dart';
import 'package:base_flutter_project/net/model/base/base_response.dart';
import 'package:base_flutter_project/net/provider/base/base_provider.dart';

import '../model/test_user_model.dart';

////网络请求的例子
class TestUserProvider extends BaseProvider {

  String _testReturnObject = '/testReturnObject';


  String _testReturnList = '/testReturnList';

  ///测试返回一个List<Model>
  Future<List<TestUserModel>?> getTestUserList() {
    return doGet<List<TestUserModel>?>(_testReturnList,
        decoder: (json) => (json
            .map<TestUserModel>((element) => TestUserModel.fromJson(element))
            .toList())).then((value) {
      return value?.data;
    });
  }

  ///测试返回单个Model
  Future<TestUserModel?> getTestUser() {
    return doGet<TestUserModel?>(_testReturnObject,
        decoder: (data) => TestUserModel.fromJson(data)).then((value) {
      return value?.data;
    });
  }
}
