import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class BottomSheetWidget {
  static show() {
    showCupertinoModalBottomSheet(context: Get.context!, builder: (context) => Container());
  }
}