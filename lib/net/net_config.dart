class NetConfig {
  String baseUrl = "http://192.168.0.138:8081";

  ///数据的名称
  static const String responseDataName="data";
  static const String responseMsgName="msg";
  static const String responseCodeName="code";

  static NetConfig get instance => _instance;
  static late final NetConfig _instance = NetConfig();
}
