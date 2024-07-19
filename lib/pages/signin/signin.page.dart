import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:ticketapp/components/button.widget.dart';
import 'package:ticketapp/components/text.widget.dart';
import 'package:ticketapp/components/textbutton.widget.dart';
import 'package:ticketapp/components/textfield.widget.dart';
import 'package:ticketapp/pages/home.page.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextWidget("Boas-vindas de volta!", customFontsize: 26, customWeight: FontWeight.w800, textAlign: TextAlign.center,),
              const TextWidget(
                "Estamos muito animados em te ver novamente!",
                customFontsize: 22,
                textAlign: TextAlign.center,
                color: Colors.grey
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
                onTap: (){
                  Get.to(() => const HomePage());
                }
              ),
              Row(
                children: [
                  const TextWidget("Não tem conta?"),
                  TextButtonWidget("Criar conta", onTap: (){}, color: Colors.blue[500],)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}