import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/pages/home.page.dart';

class SigninController extends GetxController {

  final formKey = GlobalKey<FormState>();

  validateForm(){
    if(formKey.currentState!.validate()){
      Get.to(() => const HomePage());
    }
  }


}