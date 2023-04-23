

import 'package:flutter_clean/features/character/domain/entities/comic.dart';
import 'package:flutter_clean/features/character/domain/repositories/character_repository.dart';

class GetComicsByCharacterUseCase {
  GetComicsByCharacterUseCase({
    required this.characterRepository,
  });

  late final CharacterRepository characterRepository;

  Future<List<Comic>?> execute({required int characterId}) {
    return characterRepository.getCharacterComics(characterId: characterId);
  }
}
