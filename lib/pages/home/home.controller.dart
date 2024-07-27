import 'package:get/get.dart';
import 'package:ticketapp/repositories/imp/event.repositoy.imp.dart';

class HomeController extends GetxController {
  final _eventRepository = Get.find<EventRepositoryImp>();
  bool isLoadingEvents = false;
  
  HomeController() {
    getEvents();
  }


  getEvents() async {
    _eventRepository.getEvents2();
    print("AQUI!");
  }
}