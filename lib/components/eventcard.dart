import 'package:flutter/material.dart';
import 'package:ticketapp/components/text.widget.dart';

class EventCard extends StatelessWidget {

  EventCard({super.key, required this.onTap});

  void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[500],
          borderRadius: BorderRadius.circular(16)
        ),
        child: const Column(
          children: [
            const TextWidget("28 de Junho"),
            const TextWidget("Festa do Carlão"),
            const TextWidget("Goiânia/GO - Setor Bueno")
          ],
        ),
      ),
    );
  }
}