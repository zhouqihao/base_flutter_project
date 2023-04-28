import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class AppService extends GetxService {
  StreamSubscription? _netWorkStreamSubscription;
  Rxn<ConnectivityResult> netStatus =
      Rxn<ConnectivityResult>(ConnectivityResult.none);

  @override
  void onInit() {
    super.onInit();
    _initNetowrkSub();
  }

  @override
  void onClose() {
    super.onClose();
    _netWorkStreamSubscription?.cancel();
  }

  ///监听网络变化
  void _initNetowrkSub() {
    _netWorkStreamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      netStatus.value = result;
    });
    Connectivity().checkConnectivity().then((value) {
      netStatus.value = value;
    });
  }
}
