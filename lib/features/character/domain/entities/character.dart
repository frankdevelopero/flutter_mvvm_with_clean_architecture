import 'package:flutter_clean/features/character/domain/entities/comic.dart';
import 'package:flutter_clean/features/character/domain/entities/event.dart';
import 'package:flutter_clean/features/character/domain/entities/serie.dart';
import 'package:flutter_clean/features/character/domain/entities/story.dart';

class Character {
  Character({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailURI,
    required this.comics,
    required this.series,
    required this.stories,
    required this.events,
  });

  Character.compact({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailURI,
  }) {
    comics = [];
    series = [];
    stories = [];
    events = [];
  }

  late final int id;
  late final String name;
  late final String description;
  late final String thumbnailURI;
  late final List<Comic> comics;
  late final List<Serie> series;
  late final List<Story> stories;
  late final List<Event> events;
}
