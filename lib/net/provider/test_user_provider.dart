import 'package:base_flutter_project/net/provider/base/base_provider.dart';
import 'package:base_flutter_project/sql/model/test_user_model.dart';

import '../model/test_user_model.dart';

class TestUserProvider extends BaseProvider {
  String _testUrl = '/test';

  Future<TestUser> getTestUser() {
    return get<TestUser>(_testUrl, decoder: (val) => TestUser.fromJson((val)))
        .then((value) {
      return value.body!;
    });
  }
}
