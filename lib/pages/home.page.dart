import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/components/appbar.widget.dart';
import 'package:ticketapp/components/bottomsheet.widget.dart';
import 'package:ticketapp/components/button.widget.dart';
import 'package:ticketapp/components/eventcard.dart';
import 'package:ticketapp/components/list.widget.dart';
import 'package:ticketapp/components/text.widget.dart';
import 'package:ticketapp/components/textbutton.widget.dart';
import 'package:ticketapp/pages/event/event.page.dart';
import 'package:ticketapp/pages/profile/profile.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
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
              ],
            ),
        ),
      ),
      ),
      appBar: AppbarWidget(title: "TicketApp"),
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
                  onTap: (){
                    BottomSheetWidget.show();
                  },
                  icon: const Icon(Icons.add_rounded)
                )
              ]
            ),

            SizedBox(
              height: 300,
              child: ListWidget(
                scrollDirection: Axis.horizontal,
                itemBuilder: (index, _) => EventCard(
                  onTap: () => Get.to(const EventPage())
                ),
                separatorBuilder: (_, __) => const SizedBox(width: 16),
                itemCount: 10
              ),
            )
          ],
        ),
      ),
    );
  }
}