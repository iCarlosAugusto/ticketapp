import 'package:flutter/material.dart';
import 'package:ticketapp/components/appbar.widget.dart';
import 'package:ticketapp/components/list.widget.dart';
import 'package:ticketapp/components/text.widget.dart';
import 'package:ticketapp/components/textfield.widget.dart';

class GuestListPage extends StatelessWidget {
  const GuestListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: "Lista de convidados", actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.filter_alt)
        )
      ]),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextfieldWidget(
              label: "Pesquise pelo nome",
            ),

            ListWidget(
              itemBuilder: (_, inde) => const ListTile(
                trailing: Icon(Icons.chevron_right_rounded),
                title: TextWidget("Carlos Augusto"),
                subtitle: TextWidget("Presença confirmada"),
              ),
              itemCount: 10
            )
          ],
        ),
      ),
    );
  }
}