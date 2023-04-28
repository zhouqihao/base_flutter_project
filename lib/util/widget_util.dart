import 'dart:ui';

import 'package:flutter/cupertino.dart';

class WidgetUtil {
  ///计算文本内容的宽高
  static Size boundingTextSize(String text,
      {int maxLines = 2 ^ 31,
      double maxWidth = double.infinity,
      required TextStyle textStyle}) {
    if (text == null || text.isEmpty) {
      return Size.zero;
    }
    final TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
        text: TextSpan(text: text, style: textStyle),
        maxLines: maxLines)
      ..layout(maxWidth: maxWidth);
    return textPainter.size;
  }

  ///计算文本有几行
  static List<LineMetrics> boundingTextLines(String text,
      {int maxLines = 2 ^ 31,
      double maxWidth = double.infinity,
      required TextStyle textStyle}) {
    final span = TextSpan(text: text, style: textStyle);
    final tp = TextPainter(text: span, textDirection: TextDirection.ltr);
    tp.layout(maxWidth: maxWidth);
    return tp.computeLineMetrics();
    // return numberOfLines;
  }
}
