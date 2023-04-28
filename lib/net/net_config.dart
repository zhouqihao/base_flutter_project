class NetConfig {
  String baseUrl = "http://192.168.0.138:8081";

  ///数据的名称
  static const String dataName="data";
  static NetConfig get instance => _instance;
  static late final NetConfig _instance = NetConfig();
}
