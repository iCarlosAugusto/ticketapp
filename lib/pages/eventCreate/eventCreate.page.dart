import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:ticketapp/components/appbar.widget.dart';
import 'package:ticketapp/components/button.widget.dart';
import 'package:ticketapp/components/textfield.widget.dart';
import 'package:ticketapp/pages/eventCreate/eventCreate.controller.dart';
import 'package:ticketapp/utils/Timepicker.dart';

class EventCreatePage extends StatelessWidget {
  const EventCreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EventCreateController>(
      init: EventCreateController(),
      builder: (controller) => Scaffold(
        appBar: AppbarWidget(title: "Criação de evento",),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
            child: Column(
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
                    TimePickerWidget.show(onConfirm: (DateTime time) {
                      print(time);
                    });
                  },
                  child: TextfieldWidget(
                    label: "Horário de início e fim",
                    margin: const EdgeInsets.only(bottom: 16, top: 16),
                    suffixIcon: const Icon(Icons.chevron_right_rounded),
                    enabled: false,
                  ),
                ),
                  
                TextfieldWidget(
                  label: "Nome do evento",
                  margin: const EdgeInsets.only(bottom: 16),
                  controller: controller.nameController,
                ),
                TextfieldWidget(
                  label: "Descrição",
                  margin: const EdgeInsets.only(bottom: 16),
                  controller: controller.descriptionController,
                ),
                ButtonWidget(
                  title: "Confirmar",
                  margin: const EdgeInsets.only(bottom: 16),
                  fullWidth: true,
                  onTap: () {
                    controller.createEvent();
                  }
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}