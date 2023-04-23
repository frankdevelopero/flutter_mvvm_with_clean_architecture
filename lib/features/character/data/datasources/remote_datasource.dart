import 'package:flutter_clean/features/character/domain/entities/character.dart';
import 'package:flutter_clean/features/character/domain/entities/comic.dart';
import 'package:flutter_clean/features/character/domain/entities/event.dart';
import 'package:flutter_clean/features/character/domain/entities/serie.dart';
import 'package:flutter_clean/features/character/domain/entities/story.dart';

abstract class RemoteDataSource{
  Future<List<Character>?> getAllCharacters(int offset, int limit);
  Future<Character?> getCharacterById(int id);
  Future<List<Comic>?> getComics(int offset, int limit);
  Future<List<Serie>?> getSeries(int offset, int limit);

  Future<List<Comic>?> getComicsBy({required int characterId});
  Future<List<Serie>?> getSeriesBy({required int characterId});
  Future<List<Story>?> getStoriesBy({required int characterId});
  Future<List<Event>?> getEventsBy({required int characterId});
}