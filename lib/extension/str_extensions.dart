import 'dart:developer';

import 'package:base_flutter_project/config/app_constatns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../util/date_util.dart';
import '../widget/image_view.dart';

///文本路径直接转图片widget
extension StrExtensions on String {
  ///string字符串返回图片控件
  Widget image({
    double? width,
    double? height,
    BoxFit? boxFit,
    Color? color,
    BoxShape? shape,
    BlendMode? blendMode,
  }) =>
      ImageView.from(
        this,
        width: width,
        height: height,
        fit: boxFit,
        color: color,
        colorBlendMode: blendMode,
        shape: shape,
      );


}
