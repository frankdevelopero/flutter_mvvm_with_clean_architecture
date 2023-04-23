

import 'package:flutter_clean/features/character/domain/entities/event.dart';

abstract class EventRepository {
  List<Event> getEvents();
  Event getEventById({int id});
}
