import 'package:ticketapp/models/create_event.model.dart';

abstract class EventRepository {
  Future<void> createEvent(CreateEventModel event);
}