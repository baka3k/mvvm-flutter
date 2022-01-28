import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_loading.dart';

showLoading() {
  showDialog(
    context: Get.context!,
    barrierDismissible: false,
    builder: (_) => WillPopScope(
      onWillPop: () async => false,
      child: const Center(
        child: SizedBox(
          width: 120,
          height: 120,
          child: AppLoading(),
        ),
      ),
    ),
  );
}
void hideLoading() {
  Navigator.of(Get.context!).pop();
}
