import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

import 'package:get/get.dart';

import 'app/routes/app_binding.dart';
import 'app/routes/app_pages.dart';
import 'config/app_constatns.dart';
import 'generated/l10n.dart';

Future<void> _prepare() async {
  WidgetsFlutterBinding.ensureInitialized();
  // 去掉工具栏透明色
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light),
  );
}

void main() {
  _prepare().then((value) {
    runApp(ScreenUtilInit(
      designSize: AppConstants.designSize,
      builder: (ctx, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: kDebugMode,
          getPages: AppPages.routes,
          initialRoute: AppPages.INITIAL,
          initialBinding: AppBinding(),
          navigatorObservers: [FlutterSmartDialog.observer],
          defaultTransition: Transition.rightToLeft,
          localizationsDelegates: const [S.delegate,
          GlobalMaterialLocalizations.delegate,
          // 指定本地化的字符串和一些其他的值
          GlobalCupertinoLocalizations.delegate,
          // 对应的Cupertino风格
          GlobalWidgetsLocalizations.delegate
          // 指定默认的文本排列方向, 由左到右或由右到左
          ],
          locale: Get.locale,
          supportedLocales: S.delegate.supportedLocales,
          themeMode: ThemeMode.light,
        );
      },
    ));
  });
}
