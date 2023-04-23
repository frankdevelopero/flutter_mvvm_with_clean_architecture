
import 'package:flutter_clean/features/character/data/datasources/remote_datasource.dart';
import 'package:flutter_clean/features/character/domain/entities/character.dart';
import 'package:flutter_clean/features/character/domain/entities/story.dart';
import 'package:flutter_clean/features/character/domain/entities/serie.dart';
import 'package:flutter_clean/features/character/domain/entities/event.dart';
import 'package:flutter_clean/features/character/domain/entities/comic.dart';
import 'package:flutter_clean/features/character/domain/repositories/character_repository.dart';

class CharacterRepositoryImpl implements CharacterRepository {
  CharacterRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;
  

  @override
  Future<List<Character>?> getCharacters(int offset, int limit) {
    return remoteDataSource.getAllCharacters(offset, limit);
  }
  @override
  Future<Character?> getCharacterBy({required int id}) {
    return remoteDataSource.getCharacterById(id);
  }

  @override
  Future<List<Comic>?> getCharacterComics({required int characterId}) {
    return remoteDataSource.getComicsBy(characterId: characterId);
  }

  @override
  Future<List<Event>?> getCharacterEvents({required int characterId}) {
    return remoteDataSource.getEventsBy(characterId: characterId);
  }

  @override
  Future<List<Serie>?> getCharacterSeries({required int characterId}) {
    return remoteDataSource.getSeriesBy(characterId: characterId);
  }

  @override
  Future<List<Story>?> getCharacterStories({required int characterId}) {
    return remoteDataSource.getStoriesBy(characterId: characterId);
  }
}
