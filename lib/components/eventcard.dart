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
          border: Border.all(color: Colors.black, width: 2),
          borderRadius: BorderRadius.circular(16)
        ),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget("28 de Junho", color: Colors.red, customWeight: FontWeight.w800),
            TextWidget("Festa do Carlão", customWeight: FontWeight.w800, customFontsize: 22),
            TextWidget(
              "Goiânia/GO - Setor Bueno",
              color: Colors.grey,
              customFontsize: 14,
            )
          ],
        ),
      ),
    );
  }
}