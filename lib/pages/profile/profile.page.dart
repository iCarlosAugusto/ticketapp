import 'package:flutter/material.dart';
import 'package:ticketapp/components/appbar.widget.dart';
import 'package:ticketapp/components/button.widget.dart';
import 'package:ticketapp/components/textfield.widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController(text: "Carlos");
    TextEditingController emailController = TextEditingController(text: "carlos@gmail.com");
    TextEditingController phoneController = TextEditingController(text: "(62) 98239-9800");


    return Scaffold(
      appBar: AppbarWidget(title: "Editar perfil"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextfieldWidget(
              label: "Nome",
              controller: nameController,
              margin: const EdgeInsets.only(bottom: 16),
            ),
            TextfieldWidget(
              label: "Email",
              controller: emailController,
              margin: const EdgeInsets.only(bottom: 16),
            ),
            TextfieldWidget(
              label: "Telefone",
              controller: phoneController,
              margin: const EdgeInsets.only(bottom: 16),
            ),
            const Spacer(),
            ButtonWidget(
              title: "Salvar",
              fullWidth: true,
              margin: EdgeInsets.only(bottom: 32),
              onTap: () {

            })
          ],
        ),
      ),
    );
  }
}