import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageService extends GetxService {
  static LanguageService get to => Get.find();
  var locale = Locale('en', 'US');
  var localeKey = 'en';

  Future<LanguageService> init() async {
    if (ui.window.locale.languageCode == 'zh') {
      locale = Locale('zh', 'CN');
      localeKey = 'zh-CN';
    } else {
      locale = Locale('en', 'US');
      localeKey = 'en';
    }
    return this;
  }

  void changeLocale(l) {
    if (l == Locale('zh', 'CN')) {
      localeKey = 'zh-CN';
      updateLocale(Locale('zh', 'CN'));
    } else if (l == Locale('en', 'US')) {
      localeKey = 'en';
      updateLocale(Locale('en', 'US'));
    } else if (l == Locale('vi', 'VN')) {
      localeKey = 'vi';
      updateLocale(Locale('vi', 'VN'));
    }
  }

  void updateLocale(_l) {
    locale = _l;
    Get.updateLocale(_l);
  }
}
