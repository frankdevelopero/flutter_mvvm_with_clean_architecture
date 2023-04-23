


import 'package:flutter_clean/features/character/domain/entities/character.dart';
import 'package:flutter_clean/features/character/domain/entities/comic.dart';
import 'package:flutter_clean/features/character/domain/entities/event.dart';
import 'package:flutter_clean/features/character/domain/entities/serie.dart';
import 'package:flutter_clean/features/character/domain/entities/story.dart';

abstract class CharacterRepository {
  Future<List<Character>?> getCharacters(int offset, int limit);
  Future<Character?> getCharacterBy({required int id});
  Future<List<Comic>?> getCharacterComics({required int characterId});
  Future<List<Event>?> getCharacterEvents({required int characterId});
  Future<List<Serie>?> getCharacterSeries({required int characterId});
  Future<List<Story>?> getCharacterStories({required int characterId});

}
