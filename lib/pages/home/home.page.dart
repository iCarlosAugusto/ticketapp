import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/components/appbar.widget.dart';
import 'package:ticketapp/components/button.widget.dart';
import 'package:ticketapp/components/eventcard.dart';
import 'package:ticketapp/components/list.widget.dart';
import 'package:ticketapp/components/text.widget.dart';
import 'package:ticketapp/components/textbutton.widget.dart';
import 'package:ticketapp/models/event.model.dart';
import 'package:ticketapp/pages/event/event.page.dart';
import 'package:ticketapp/pages/eventCreate/eventCreate.page.dart';
import 'package:ticketapp/pages/home/home.controller.dart';
import 'package:ticketapp/pages/profile/profile.page.dart';
import 'package:ticketapp/pages/signin/signin.page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder:(controller) => Scaffold(
          drawer: Drawer(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
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
                StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("events").snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {                
                    if (snapshot.data?.size == 0) {
                      return const Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            TextWidget(
                              "Parece que você ainda não tem nenhum evento, crie um agora",
                              textAlign: TextAlign.center,
                              customFontsize: 16,
                              customWeight: FontWeight.w800,
                            ),
                          ],
                        )
                      );
                    }
                    List<Event>? list = snapshot.data?.docs.map((doc) => Event.fromJson(doc.data() as Map<String, dynamic>)).toList();
                    return SizedBox(
                      height: 130,
                      child: ListWidget(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          Event currentEvent = list![index];
                          return EventCard(
                            name: currentEvent.name,
                            description: currentEvent.description,
                            location: "Setor bueno",
                            date: "29 de Jun",
                            onTap: () => Get.to(() => EventPage(event: currentEvent), transition: Transition.cupertino)
                          );
                        },
                        separatorBuilder: (_, __) => const SizedBox(width: 16),
                        itemCount: list?.length ?? 0
                      ),
                    );
                  }  
                ),
              ],
            ),
          ),
        ),
    );
  }
}