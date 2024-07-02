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
          border: Border.all(color: Colors.purple, width: 2),
          color: Colors.purple[50],  
          borderRadius: BorderRadius.circular(16)
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget("28 de Junho"),
            TextWidget("Festa do Carlão"),
            TextWidget("Goiânia/GO - Setor Bueno")
          ],
        ),
      ),
    );
  }
}