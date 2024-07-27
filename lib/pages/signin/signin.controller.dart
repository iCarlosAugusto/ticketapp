import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ticketapp/components/loadingfullscreen.widget.dart';
import 'package:ticketapp/pages/home/home.page.dart';

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

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    try {
          final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }

  }
}