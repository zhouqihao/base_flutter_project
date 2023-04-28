import 'package:base_flutter_project/config/app_constatns.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum ControlEvent { UP, DOWN, BACK, LEFT, RIGHT, OK, HOME, XING, JING, CAMERA }

///遥控器点击事件
typedef ControlClickCallBack = bool? Function(ControlEvent controlEvent);

///同时响应遥控器和点击事件的控件
class FocusEventWidget extends StatefulWidget {
  ///有焦点的样式
  Decoration? focusDecoration;

  ///默认样式
  Decoration? decoration;

  ////焦点
  FocusNode? focusNode;

  ///外间距
  EdgeInsetsGeometry? margin;

  ///内间距
  EdgeInsetsGeometry? padding;

  ///默认宽度
  double? width;

  ///默认高度
  double? height;

  ///获得焦点宽度
  double? focusWidth;

  ///获得焦点高度
  double? focusHeight;

  ///获得焦点的时候缩放比例
  double? focusScale;

  ///默认的时候缩放比例
  double? normalScale;

  ///遥控器点击确认事件或者手指按下事件，传入这个后controlClickCallBack不会相应遥控器确认事件
  VoidCallback? okCallBack;

  ///焦点改变通知
  ValueChanged<bool>? onFocusChange;

  ///按键通知
  ControlClickCallBack? controlClickCallBack;

  ///子控件
  Widget child;

  ///子控件位置
  Alignment childAlignment;

  ///获得焦点时的子控件
  Widget? focusChild;

  ///是否允许点击事件
  bool enableTap = false;

  ///是否自动获取焦点
  bool autoFocus = false;

  ///是否开启焦点监听
  bool enableFocus = true;

  ///是否使用focusNode
  bool userFocusNode = true;

  FocusEventWidget(
      {this.focusNode,
      required this.child,
      this.focusDecoration,
      this.decoration,
      this.width,
      this.focusWidth,
      this.normalScale,
      this.childAlignment = Alignment.center,
      this.focusHeight,
      this.focusScale,
      this.height,
      this.autoFocus = false,
      this.enableFocus = true,
      this.userFocusNode = true,
      this.enableTap = false,
      this.margin,
      this.padding,
      this.onFocusChange,
      this.focusChild,
      this.controlClickCallBack,
      this.okCallBack});

  @override
  State<FocusEventWidget> createState() => _FocusEventWidgetState();
}

class _FocusEventWidgetState extends State<FocusEventWidget> {
  FocusNode? _focusNode;

  @override
  void initState() {
    if (widget.focusWidth != null && widget.focusScale != null) {
      throw ErrorHint('焦点尺寸和焦点放大比例只能二选一');
    }
    if (widget.enableFocus && widget.userFocusNode) {
      _focusNode = widget.focusNode ?? FocusNode();
    }
    super.initState();
    // widget.focusNode.requestFocus();
  }

  bool get _hasFocus => _focusNode?.hasFocus ?? false;

  @override
  Widget build(BuildContext context) {
    Widget child = Container(
      margin: widget.margin,
      padding: widget.padding,
      width: _focusNode?.hasFocus ?? false
          ? (widget.focusWidth ?? widget.width)
          : widget.width,
      height: _focusNode?.hasFocus ?? false
          ? (widget.focusHeight ?? widget.height)
          : widget.height,
      decoration: _focusNode?.hasFocus ?? false
          ? (widget.focusDecoration ?? widget.decoration)
          : widget.decoration,
      child: Align(
        alignment: Alignment.center,
        child: _focusNode?.hasFocus ?? false
            ? (widget.focusChild ?? widget.child)
            : widget.child,
      ),
    );

    ///有焦点的时候放大widget
    if (widget.focusScale != null || widget.normalScale != null) {
      child = Transform.scale(
        child: child,
        scale: _hasFocus ? widget.focusScale ?? 1 : widget.normalScale ?? 1,
      );
    }

    Widget focusContent = child;
    if (widget.enableFocus) {
      focusContent = Focus(
        child: child,
        autofocus: widget.autoFocus,
        onFocusChange: _onFocusChange,
        focusNode: _focusNode,
        onKey: _onFocusKey,
      );
    }

    bool isEnableTap = widget.enableTap;
    if (kDebugMode && !isEnableTap) {
      isEnableTap = true;
    }
    if (isEnableTap) {
      return GestureDetector(
        child: focusContent,
        onTap: () {
          if (widget.enableFocus) {
            _focusNode?.requestFocus();
          }
          if (widget.okCallBack != null && isEnableTap) {
            widget.okCallBack?.call();
          }
        },
      );
    } else {
      return focusContent;
    }
  }

  KeyEventResult _onFocusKey(FocusNode node, RawKeyEvent event) {
    bool isHandle = _onKeyEvent(event) ?? false;
    return isHandle ? KeyEventResult.handled : KeyEventResult.ignored;
  }

  bool? _notifyEvent(ControlEvent controlEvent) {
    if (widget.controlClickCallBack != null) {
      return widget.controlClickCallBack!(controlEvent) ?? false;
    }
    return false;
  }

  bool? _onKeyEvent(RawKeyEvent event) {
    if (event.runtimeType == RawKeyDownEvent) {
      if (event.data is RawKeyEventDataAndroid) {
        RawKeyEventDataAndroid datga = event.data as RawKeyEventDataAndroid;
        switch (datga.keyCode) {
          case 3:
            return _notifyEvent(ControlEvent.HOME);

            break;

          case 4:
            return _notifyEvent(ControlEvent.BACK);

            break;
          case 23:
            if (widget.okCallBack != null) {
              widget.okCallBack?.call();
              return true;
            } else {
              return _notifyEvent(ControlEvent.OK);
            }
            break;
          case 17:
            //*
            return _notifyEvent(ControlEvent.XING);
            break;
          case 18:
            //#
            return _notifyEvent(ControlEvent.JING);
            break;
          case 19:
            //向上
            return _notifyEvent(ControlEvent.UP);
            break;
          case 20:
            //向下
            return _notifyEvent(ControlEvent.DOWN);
            break;
          case 21:
            //向左
            return _notifyEvent(ControlEvent.LEFT);

            break;
          case 22:
            //香油
            return _notifyEvent(ControlEvent.RIGHT);

            break;
          case 27:
            //香油
            return _notifyEvent(ControlEvent.CAMERA);

            break;
        }
      }
    }

    return false;
  }

  void _onFocusChange(value) {
    if (widget.onFocusChange != null) {
      widget.onFocusChange!(value);
    }
    setState(() {});
  }
}
