import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:ticketapp/components/appbar.widget.dart';
import 'package:ticketapp/components/bottomsheet.widget.dart';
import 'package:ticketapp/components/button.widget.dart';
import 'package:ticketapp/components/eventcard.dart';
import 'package:ticketapp/components/list.widget.dart';
import 'package:ticketapp/components/text.widget.dart';
import 'package:ticketapp/components/textbutton.widget.dart';
import 'package:ticketapp/pages/event/event.page.dart';
import 'package:ticketapp/pages/eventCreate/eventCreate.page.dart';
import 'package:ticketapp/pages/profile/profile.page.dart';
import 'package:ticketapp/pages/signin/signin.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoScaffold(
      body: Scaffold(
        drawer: Drawer(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                // Important: Remove any padding from the ListView.
                //padding: EdgeInsets.zero,
                children: [
                  ListTile(
                    title: const TextWidget("Olá, Carlos"),
                    onTap: () async  {
                      Get.back();
                      await Future.delayed(const Duration(milliseconds: 500));
                      Get.to(() => const ProfilePage());
                    }
                  ),
                  ListTile(
                    leading: const Icon(Icons.plagiarism_outlined),
                    title: const TextWidget("Planos"),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  const Spacer(),
                  ListTile(
                    leading: const Icon(Icons.highlight_off_rounded),
                    title: const TextWidget("Sair"),
                    onTap: () {
                      Get.offAll(() => const Signin());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        appBar: AppbarWidget(
          title: "TicketApp",
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded))
          ]
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: Colors.red[200]
                ),
                child: Column(
                  children: [
                    const TextWidget("Conheça o TicketApp plus, o novo club para membros premium!"),
                    ButtonWidget(
                      title: "Quero conhecer!",
                      fullWidth: true,
                      margin: const EdgeInsets.only(top: 16),
                      onTap: () {}
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextWidget(
                    "Meus eventos",
                    customFontsize: 24,
                    margin: EdgeInsets.only(top: 16, bottom: 16)
                  ),
                  TextButtonWidget(
                    "Criar novo",
                    onTap: () => Get.to(() => const EventCreatePage()),
                    icon: const Icon(Icons.add_rounded)
                  )
                ]
              ),
      
              SizedBox(
                height: 150,
                child: ListWidget(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (index, _) => EventCard(
                    onTap: () => Get.to(() => const EventPage(), transition: Transition.cupertino)
                  ),
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemCount: 10
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}