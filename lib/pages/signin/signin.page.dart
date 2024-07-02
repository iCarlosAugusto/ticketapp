import 'package:flutter/material.dart';
import 'package:ticketapp/components/button.widget.dart';
import 'package:ticketapp/components/text.widget.dart';
import 'package:ticketapp/components/textbutton.widget.dart';
import 'package:ticketapp/components/textfield.widget.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextfieldWidget(
                label: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              TextfieldWidget(
                margin: const EdgeInsets.only(top: 16),
                label: "Senha",
              ),
              TextButtonWidget(
                "Esqueci a senha",
                onTap: () {
          
                }
              ),
              ButtonWidget(
                title: "Entrar",
                margin: const EdgeInsets.only(top: 16),
                fullWidth: true,
                onTap: (){
          
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