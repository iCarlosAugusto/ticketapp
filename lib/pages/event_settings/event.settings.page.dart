import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:ticketapp/components/appbar.widget.dart';
import 'package:ticketapp/components/button.widget.dart';
import 'package:ticketapp/components/textfield.widget.dart';
import 'package:ticketapp/utils/Timepicker.dart';

class EventSettingsPage extends StatelessWidget {
  const EventSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(
        title: "Configurações",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            EasyDateTimeLine(
              initialDate: DateTime.now(),
              locale: "pt_Br",
              activeColor: Colors.blue,                 
              headerProps: const EasyHeaderProps(
                monthPickerType: MonthPickerType.switcher,
                showSelectedDate: true,
                monthStyle: TextStyle(fontFamily: 'Sora'),
                selectedDateStyle: TextStyle(fontFamily: 'Sora', fontWeight: FontWeight.w600)
              ),
            ),
            GestureDetector(
              onTap: () {
                TimePickerWidget.show(onConfirm: (String time) {
                  print(time);
                });
              },
              child: TextfieldWidget(
                label: "Horário de início e fim",
                margin: const EdgeInsets.only(top: 16),
                suffixIcon: const Icon(Icons.chevron_right_rounded),
                enabled: false,
              ),
            ),

            TextfieldWidget(
              label: "Nome do evento",
              margin: const EdgeInsets.only(top: 16),
            ),
            TextfieldWidget(
              label: "Descrição",
              margin: const EdgeInsets.only(top: 16),
            ),
            TextfieldWidget(
              label: "Nome do evento",
              margin: const EdgeInsets.only(top: 16),
            ),
            TextfieldWidget(
              label: "Nome do evento",
              margin: const EdgeInsets.only(top: 16),
            ),
            ButtonWidget(
              title: "Confirmar",
              margin: const EdgeInsets.only(top: 16),
              fullWidth: true,
              onTap: () {
              }
            )
          ],
        ),
      ),
    );  
  }
}