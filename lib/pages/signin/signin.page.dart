import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ticketapp/components/button.widget.dart';
import 'package:ticketapp/components/text.widget.dart';
import 'package:ticketapp/components/textbutton.widget.dart';
import 'package:ticketapp/components/textfield.widget.dart';
import 'package:ticketapp/pages/home/home.page.dart';
import 'package:ticketapp/pages/signin/signin.controller.dart';
import 'package:ticketapp/pages/signup/signup.page.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SigninController(),
      builder: (controller) => Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextWidget("Boas-vindas de volta!", customFontsize: 26, customWeight: FontWeight.w800, textAlign: TextAlign.center,),
                const TextWidget(
                  "Estamos muito animados em te ver novamente!",
                  customFontsize: 22,
                  textAlign: TextAlign.center,
                  color: Colors.grey,
                  margin: EdgeInsets.only(bottom: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () => controller.signInWithGoogle(),
                      //          // "package_name": "io.github.icarlosaugusto"
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16)
                        ),
                        padding: const EdgeInsets.all(16),
                        child: SvgPicture.asset(
                          "assets/images/google-logo.svg",
                          semanticsLabel: 'Google Signin'
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16)
                      ),
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset(
                        "assets/images/apple-logo.svg",
                        semanticsLabel: 'Apple Signin'
                      ),
                    ),
                  ],
                ),
                TextfieldWidget(
                  label: "Email",
                  keyboardType: TextInputType.emailAddress,
                  margin: const EdgeInsets.only(top: 16),
                  notEmpty: true,
                ),
                TextfieldWidget(
                  margin: const EdgeInsets.only(top: 16),
                  label: "Senha",
                  isPasswordField: true,
                  notEmpty: true,
                ),
                Container(
                  width: Get.width,
                  alignment: Alignment.centerLeft,
                  child: TextButtonWidget(
                    "Esqueci a senha",
                    onTap: () {
                            
                    }
                  ),
                ),
                ButtonWidget(
                  title: "Entrar",
                  margin: const EdgeInsets.only(top: 16),
                  fullWidth: true,
                  onTap: () => controller.validateForm()
                ),
                Row(
                  children: [
                    const TextWidget("Não tem conta?"),
                    TextButtonWidget(
                      "Criar conta",
                      onTap: () => Get.to(() => SignupPage()),
                      color: Colors.blue[500]
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}