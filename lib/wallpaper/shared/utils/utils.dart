import 'package:flutter/material.dart';
import 'package:get/get.dart';

bool isApple() {
  return Get.theme.platform == TargetPlatform.macOS ||
      Get.theme.platform == TargetPlatform.iOS;
}

bool isAndroid() {
  return Get.theme.platform == TargetPlatform.android ||
      Get.theme.platform == TargetPlatform.iOS;
}
