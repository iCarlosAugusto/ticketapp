import 'package:ticketapp/models/create_event.model.dart';
import 'package:ticketapp/models/event.model.dart';

abstract class EventRepository {
  Future<void> createEvent(CreateEventModel event);
  //Future<List<Event>> getEvents();
}