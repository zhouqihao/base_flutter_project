import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:base_flutter_project/extension/object_extensions.dart';
import 'package:base_flutter_project/util/string_util.dart';
import 'package:crypto/crypto.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

import '../../model/base/base_response.dart';
import '../../net_config.dart';

class BaseProvider<T> extends GetConnect {
  @override
  void onInit() {
    /// 请求url
    httpClient.baseUrl = NetConfig.instance.baseUrl;

    // // 解码器.
    // httpClient.defaultDecoder = _defaultDecode;

    /// 请求拦截.
    httpClient.addRequestModifier<dynamic>(_requestIntercept);

    ///响应拦截
    httpClient.addResponseModifier<dynamic>(_responseIntercept);
  }

  FutureOr<Request<dynamic>> _requestIntercept(Request<dynamic> request) async {
    customPrintInfo('开始请求 url： ${request.url.toString()}');
    customPrintInfo('method： ${request.method}');

    //todo 添加公共请求头

    return request;
  }

  ///响应拦截
  FutureOr<Response<dynamic>> _responseIntercept(request,Response response) {
    if (response.body == null) {
      customPrintInfo('接口异常:url:${request.url.toString()} ');
      customPrintInfo(
          '状态码:${response.statusCode}   错误信息:${response.statusText}');
      customPrintInfo('详情:${response.bodyString}');
    }else{
      customPrintInfo('请求成功:url:${request.url.toString()} ');
      customPrintInfo('响应数据:${jsonEncode(jsonDecode(response.bodyString??""))} ');

    }
    return Future.value(response);
  }

  Type typeOf<T>() => T;

  ///数据解析
  BaseResponse<T>? _defaultDecode<T>(data, Decoder<T>? decoder) {
    if (data != null) {
      try {
        return BaseResponse.fromJson(
            data,
            decoder ??
                (data) {
                  ///文本类型稍微转一下
                  if (typeOf<T>() == typeOf<String?>() ||
                      typeOf<T>() == typeOf<String?>()) {
                    return data.toString() as T;
                  }
                  return data;
                });
      } catch (e) {}
    }
    return null;
  }

  ///Get请求
  Future<BaseResponse<T>?> doGet<T>(
    String url, {
    Map<String, String>? headers,
    String? contentType,
    Decoder<T>? decoder,
    Map<String, dynamic>? query,
  }) {
    return super
        .get<BaseResponse<T>?>(url,
            headers: headers,
            contentType: contentType,
            query: query,
            decoder: (data) => _defaultDecode(data, decoder))
        .then((value) {
      return value.body;
    });

    return Future(() => null);
  }
}
