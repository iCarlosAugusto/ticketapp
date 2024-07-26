import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ticketapp/components/loadingfullscreen.widget.dart';
import 'package:ticketapp/components/snackbar.widget.dart';
import 'package:ticketapp/models/create_event.model.dart';
import 'package:ticketapp/repositories/imp/event.repositoy.imp.dart';

class EventCreateController extends GetxController {

  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final dateController = TextEditingController();
  final _eventRepository = Get.find<EventRepositoryImp>();

  void validateForm() async {
    if(formKey.currentState!.validate()){
      await _createEvent();
      _showFeedback();
    }
  }

  void onSelectDate(String date) {
    dateController.text = date;
  }

  _createEvent() async{ 
    LoadingFullscreen.startLoading();
    await Future.delayed(const Duration(milliseconds: 1500));
    final event = CreateEventModel(name: nameController.text, description: descriptionController.text);
    await _eventRepository.createEvent(event);
    LoadingFullscreen.stopLoading();
  }

  _showFeedback(){
    Get.back();
    SnackbarWidget.show("Evento criado!", "Agora é só curtir!");
  }
}