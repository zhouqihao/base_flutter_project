import 'dart:io';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';

class ImageView extends StatelessWidget {
  const ImageView.from(
    String url, {
    super.key,
    this.width,
    this.height,
    this.color,
    this.maxBytes,
    this.opacity,
    this.colorBlendMode,
    this.localPath,
    this.fit = BoxFit.cover,
    this.borderRadius,
    this.shape,
    this.backgroundColor = Colors.transparent,
    this.error,
  }) : file = url;

  final String file;
  final double? width;
  final int? maxBytes;

  final String? localPath;
  final double? height;
  final Color? color;
  final Color? backgroundColor;
  final Animation<double>? opacity;
  final BlendMode? colorBlendMode;
  final BoxFit? fit;
  final BoxShape? shape;
  final BorderRadius? borderRadius;
  final String? error;

  @override
  Widget build(BuildContext context) {
    return _createExtendImage(context);
  }

  Widget _createExtendImage(BuildContext context) {
    Widget? child;

    if (localPath != null && localPath!.isNotEmpty) {
      ///先加载本地的图片
      child = ExtendedImage.file(
        File(localPath!),
        width: width,
        height: height,
        color: color,
        opacity: opacity,
        colorBlendMode: colorBlendMode,
        maxBytes: maxBytes,
        fit: fit,
        cacheRawData: true,
        clearMemoryCacheWhenDispose: true,
        loadStateChanged: (ExtendedImageState state) {
          if (state.extendedImageLoadState == LoadState.failed) {
            ///本地图片加载失败了,那么加载file图片
            return _build_file_by_file();
          }
        },
        shape: shape,
      );
    } else {
      child = _build_file_by_file();
    }

    child = Container(
      width: width,
      height: height,
      color: backgroundColor ?? Theme.of(context).hintColor.withOpacity(.05),
      child: child ?? Center(),
    );

    if (borderRadius != null) {
      return ClipRRect(
        child: child,
        borderRadius: borderRadius,
      );
    }
    return child;
  }

  Widget? _build_file_by_file() {
    Widget? child;
    if ((file).startsWith('http')) {
      child = ExtendedImage.network(
        file,
        width: width,
        height: height,
        color: color,
        opacity: opacity,
        colorBlendMode: colorBlendMode,
        maxBytes: maxBytes,
        fit: fit,
        cacheRawData: true,
        shape: shape,
        loadStateChanged: _onLoadImageFailed,
      );
    } else if (file.startsWith('assets')) {
      child = ExtendedImage.asset(
        file,
        width: width,
        height: height,
        maxBytes: maxBytes,
        color: color,
        opacity: opacity,
        colorBlendMode: colorBlendMode,
        fit: fit,
        cacheRawData: true,
        shape: shape,
        loadStateChanged: _onLoadImageFailed,
      );
    } else if (file.isNotEmpty == true) {
      /// 本地文件.
      child = ExtendedImage.file(
        File(file),
        width: width,
        height: height,
        color: color,
        maxBytes: maxBytes,
        opacity: opacity,
        colorBlendMode: colorBlendMode,
        fit: fit,
        cacheRawData: true,
        shape: shape,
        loadStateChanged: _onLoadImageFailed,
      );
    } else {}
    return child;
  }

  Widget? _onLoadImageFailed(ExtendedImageState state) {
    if (state.extendedImageLoadState == LoadState.failed) {}
    return null;
  }
}
