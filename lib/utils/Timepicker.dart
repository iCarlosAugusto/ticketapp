import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/components/textbutton.widget.dart';

class TimePickerWidget {
  static show({required Function(DateTime time) onConfirm}) async {

    if (Platform.isAndroid) {
      TimeOfDay? timeSelectedAndroid = await showTimePicker(
        initialEntryMode: TimePickerEntryMode.input,
        orientation: Orientation.portrait,
        context: Get.context!,
        initialTime: TimeOfDay.now(),                
        helpText: "Fechamento",
        errorInvalidText: "Horário inválido",
        hourLabelText: "Horas",
        minuteLabelText: "Minutos",
        cancelText: "Voltar",
        confirmText: "Confirmar",
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        },
      );

      if(timeSelectedAndroid != null) {
        final now = DateTime.now();
        var date = DateTime(now.year, now.month, now.day, timeSelectedAndroid.hour, timeSelectedAndroid.minute);
        onConfirm(date);
      }
    } else if (Platform.isIOS) {
      DateTime timeSelectedIos = DateTime.now();

      await showCupertinoModalPopup(
        context: Get.context!,
        builder:(_) => Material(
          child: Container(
            height: 216,
            width: Get.width,
            color: Colors.white,
            padding: const EdgeInsets.only(top: 6.0),
            child: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 100),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButtonWidget(
                        "Cancelar",
                        color: CupertinoColors.systemBlue,
                        onTap: () {
                          Get.back();
                        }
                      ),
                      TextButtonWidget(
                        "Confirmar",
                        color: CupertinoColors.systemBlue,
                        onTap: () {
                          onConfirm(timeSelectedIos);
                          Get.back();
                        }, 
                      )
                    ],
                  ),
                ),
                Positioned.fill(
                  child: Align(
                    child: SizedBox(
                      height: 140,
                      width: Get.width,
                      child: CupertinoDatePicker(
                        initialDateTime:  DateTime(2016, 5, 10, 22, 35),
                        mode: CupertinoDatePickerMode.time,
                        use24hFormat: true,
                        onDateTimeChanged: (DateTime newTime) {
                          timeSelectedIos = newTime;
                        },
                      ),
                    ),
                  ),
                ),
              ] 
            ),
          ),
        )
      );
    }
  }
}
