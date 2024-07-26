import 'package:get/get.dart';

class SnackbarWidget {
  static show(String title, String message) {
    Get.snackbar(title, message);
  }
}