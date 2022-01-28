import 'package:base_source/generated/locales.g.dart';
import 'package:base_source/translations/language_service.dart';
import 'package:flutter/material.dart';
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
    return GetMaterialApp(
      title: 'MVVM Base Source',
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translations,
      locale: LanguageService.to.locale, // locale
      fallbackLocale: Locale("en", "US"), // false back
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: HomeScreen()
    );
  }
}

Future<void> initServices() async {
  print('starting services ...');
  await Get.putAsync(() => LanguageService().init());
  print('All services started...');
}
