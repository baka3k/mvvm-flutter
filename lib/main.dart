import 'package:base_source/generated/locales.g.dart';
import 'package:base_source/translations/language_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  initServices();
  runApp(const BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    updateStatusBar();
    return GetMaterialApp(
      title: 'MVVM Base Source',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translations,
      locale: LanguageService.to.locale, // locale
      fallbackLocale: Locale("en", "US"), // false back
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.blue),
            elevation: 0.0,
            color: Colors.white),
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomeScreen()
    );
  }

  void updateStatusBar() {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
  }
}

Future<void> initServices() async {
  print('starting services ...');
  await Get.putAsync(() => LanguageService().init());
  print('All services started...');
}
