import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:ticketapp/components/appbar.widget.dart';
import 'package:ticketapp/components/list.widget.dart';
import 'package:ticketapp/components/text.widget.dart';
import 'package:ticketapp/pages/guest_list/guest.list.page.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Festa do João"),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
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
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(12))
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
                onTap: () {
                  Get.to(() => const GuestListPage());
                },
              ),
              itemCount: 20
            )
          ],
        ),
      ),
    );
  }
}