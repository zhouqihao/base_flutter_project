import 'package:base_flutter_project/extension/object_extensions.dart';
import 'package:base_flutter_project/net/provider/test_user_provider.dart';
import 'package:base_flutter_project/service/app_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomeView'),
          centerTitle: true,
        ),
        body: Container(
          child: Obx(
            () => Container(
              padding: EdgeInsets.all(10.w),
              height: double.maxFinite,
              width: double.maxFinite,
              child: Center(
                child: Column(
                  children: [
                    _networkStatus(),
                    _testSingleResponse(),
                    _testMultiResponse()
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Text _networkStatus() {
    return Text(
      '网络状态${get<AppService>().netStatus.value} ',
      style: TextStyle(fontSize: 20),
    );
  }

  _testSingleResponse() {
    return InkWell(
      onTap: controller.getSingleUser,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.red.withOpacity(.2),
        child: Center(
          child: Text("获取单个测试用户网络数据"),
        ),
        height: 40.w,
      ),
    );
  }

  _testMultiResponse() {
    return InkWell(
      onTap:controller.getMultiUser,
      child: Container(
        margin: EdgeInsets.only(top: 10),
        color: Colors.red.withOpacity(.2),
        child: Center(
          child: Text("获取多个测试用户网络数据"),
        ),
        height: 40.w,
      ),
    );
  }
}
