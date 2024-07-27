import 'package:flutter/material.dart';
import 'package:ticketapp/components/text.widget.dart';

class EventCard extends StatelessWidget {

  EventCard({
    super.key,
    required this.name,
    required this.description,
    required this.location,
    required this.date,
    required this.onTap

  });

  String name;
  String? description;
  String location;
  String date;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(date, color: Colors.red, customWeight: FontWeight.w800),
            TextWidget(name , customWeight: FontWeight.w800, customFontsize: 22),
            TextWidget(location, color: Colors.grey, customFontsize: 14)
          ],
        ),
      ),
    );
  }
}