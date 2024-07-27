import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:ticketapp/components/appbar.widget.dart';
import 'package:ticketapp/components/button.widget.dart';
import 'package:ticketapp/components/text.widget.dart';
import 'package:ticketapp/components/textbutton.widget.dart';
import 'package:ticketapp/components/textfield.widget.dart';
import 'package:ticketapp/pages/home/home.page.dart';
import 'package:ticketapp/pages/signin/signin.page.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget("É um prazer tê-lo conosco =)", customFontsize: 26, customWeight: FontWeight.w800, textAlign: TextAlign.center,),
              const TextWidget(
                "Estamos animados para te conhecer",
                customFontsize: 22,
                textAlign: TextAlign.center,
                color: Colors.grey
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
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
                label: "Nome",
                keyboardType: TextInputType.emailAddress,
                margin: const EdgeInsets.only(top: 16),
              ),
              TextfieldWidget(
                label: "Email",
                keyboardType: TextInputType.emailAddress,
                margin: const EdgeInsets.only(top: 16),
              ),
              TextfieldWidget(
                margin: const EdgeInsets.only(top: 16),
                label: "Senha",
                isPasswordField: true,
              ),
              ButtonWidget(
                title: "Registrar",
                margin: const EdgeInsets.only(top: 16),
                fullWidth: true,
                onTap: (){
                  Get.to(() => const HomePage());
                }
              ),
              Row(
                children: [
                  const TextWidget("Já tem conta?"),
                  TextButtonWidget(
                    "Entrar",
                    onTap: () => Get.to(() => Signin()),
                    color: Colors.blue[500]
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}