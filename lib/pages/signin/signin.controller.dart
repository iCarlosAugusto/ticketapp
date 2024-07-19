import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/components/loadingfullscreen.widget.dart';
import 'package:ticketapp/pages/home.page.dart';

class SigninController extends GetxController {

  final formKey = GlobalKey<FormState>();

  validateForm() async {
    if(formKey.currentState!.validate()){
      LoadingFullscreen.startLoading();
      await Future.delayed(const Duration(seconds: 2));
      LoadingFullscreen.stopLoading();
      Get.to(() => const HomePage());
    }
  }
}