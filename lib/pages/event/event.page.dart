import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ticketapp/components/appbar.widget.dart';
import 'package:ticketapp/components/list.widget.dart';
import 'package:ticketapp/components/text.widget.dart';
import 'package:ticketapp/pages/event_settings/event.settings.page.dart';
import 'package:ticketapp/pages/guest_list/guest.list.page.dart';
import 'package:ticketapp/utils/Qr.code.scanner.dart';

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Festa do João",
        actions: [
          IconButton(
            onPressed: (){
              Get.to(() => const EventSettingsPage());
            },
            icon: const Icon(Icons.settings)
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          String code = await QRCodeScanner.scan();
          print(code);
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.qr_code),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width,              
              height: 100,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWidget("Total de convidados: 10"),
                  TextWidget("Receita total: R\$200")
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                Share.share('check out my website https://example.com', subject: 'Look what I made!');
                print("Compartilhando...");
              },
              child: Container(
                width: Get.width,
                margin: const EdgeInsets.only(top: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  border: Border.all(width: 2, color: Colors.purple)
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget("Compartilhe o convite do seu evento!"),
                    Icon(Icons.share)
                  ],
                ),
              ),
            ),  
            ListWidget(
              itemBuilder: (index, __) => ListTile(
                title: const TextWidget("Lista de convidados"),
                trailing: const Icon(Icons.chevron_right_rounded),
                leading: const Icon(Icons.people_outline),
                onTap: () {
                  Get.to(() => const GuestListPage());
                },
              ),
              itemCount: 1
            )
          ],
        ),
      ),
    );
  }
}