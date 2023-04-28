import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:base_flutter_project/extension/object_extensions.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';


import '../../model/base/base_response.dart';
import '../../net_config.dart';

class BaseProvider<T  > extends GetConnect {
  @override
  void onInit() {
    /// 请求url
    httpClient.baseUrl = NetConfig.instance.baseUrl;

    // // 解码器.
    httpClient.defaultDecoder = _defaultDecode;

    /// 请求拦截.
    httpClient.addRequestModifier<dynamic>(_requestIntercept);

    ///响应拦截
    httpClient.addResponseModifier<dynamic>(_responseIntercept);
  }



  FutureOr<Request<dynamic>> _requestIntercept(Request<dynamic> request) async {
    customPrintInfo('request url： ${request.url.toString()}');
    customPrintInfo('request method： ${request.method}');

    //todo 添加请求参数

    return request;
  }

  ///响应拦截
  FutureOr<Response<dynamic>> _responseIntercept(request, response) {
    customPrintInfo(
        'addResponseModifier： ${response.toString()}, ${request.toString()}');

    return Future.value(response);
  }

  /// 默认的解码器
  dynamic _defaultDecode(dynamic response) {
    customPrintInfo('preDecode： ${response.toString()}');

    var result = response;

    if (result is String) {
      result = json.decode(result);
    } else if (result is Map) {
      if (result[NetConfig.dataName] != null) {
        String content = result[NetConfig.dataName];
        customPrintInfo(content);
        result = json.decode(content);
      }
    }

    return result as Map<String, dynamic>;
  }

  @override
  Future<Response<T>> get<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
  }) {

    return super
        .get<T>(
      url,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    ).then((value) {
      if (value.body == null) {
        String errorText = value.statusText ?? '';
        /// 请求失败处理
        return Future.error(errorText);
      }
      return value;
    });
    try {

    } catch (e) {
      return Future.error(e);
    }
  }

  @override
  Future<Response<T>> post<T>(
    String? url,
    dynamic body, {
    String? contentType,
    Map<String, String>? headers,
    Map<String, dynamic>? query,
    Decoder<T>? decoder,
    Progress? uploadProgress,
  }) {
    return super
        .post<T>(url, body,
            contentType: contentType,
            headers: headers,
            query: query,
            decoder: decoder,
            uploadProgress: uploadProgress)
        .then((value) {
      if (value.body == null) {
        String errorText = value.statusText ?? '';
        customPrintInfo(errorText);

        /// 请求失败处理
        return Future.error(errorText);
      }
      return value;
    });
  }
}
