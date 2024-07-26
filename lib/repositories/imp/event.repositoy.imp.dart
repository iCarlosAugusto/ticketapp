import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ticketapp/models/create_event.model.dart';
import 'package:ticketapp/repositories/event.repository.dart';

class EventRepositoryImp implements EventRepository {
  final CollectionReference events = FirebaseFirestore.instance.collection('events');

  @override
  Future<void> createEvent(CreateEventModel event) async {
    await events.add(event.toJson());
  }
}