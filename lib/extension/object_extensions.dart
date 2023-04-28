import 'dart:developer';

import 'package:base_flutter_project/config/app_constatns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/get_instance.dart';

import '../util/date_util.dart';
import '../widget/image_view.dart';

///针对object的扩展方法
extension ObjectExtensions on Object {
  ///获取get的实体类
  S get<S>() => GetInstance().find<S>();

  ///打印log,自动在debug模式下打印，release打包的不会打印
  ///
  /// @param : isForcePrint 是否强制打印，为true时，在release模式下也会强制打印
  void customPrintInfo(Object info, {String? tag, bool isForcePrint = false}) {
    if (isForcePrint || isDebug) {
      String className = this.runtimeType.toString();
      ///这里只是为了让打log看着整齐，尽量让类名占20个字符
      if (className.length < 20) {
        for (int i = className.length; i < 20; i++) {
          className = className + " ";
        }
      }
      String start =
          "${className} ${(tag ?? "").isNotEmpty ? '[' + (tag ?? '') + '] ' : ''} ${DateUtil.formatTime(DateTime.now())} ";


      log("${start}: ${info.toString()}");
    }
  }

  ///是否是debug模式
  bool get isDebug => AppConstants.isDebug;
}
