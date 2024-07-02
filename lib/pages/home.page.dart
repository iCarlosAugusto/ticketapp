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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Meus eventos"),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_rounded),
      ),
    );
  }
}