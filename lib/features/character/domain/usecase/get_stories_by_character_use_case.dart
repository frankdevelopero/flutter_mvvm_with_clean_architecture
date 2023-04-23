import 'package:flutter_clean/features/character/domain/entities/story.dart';
import 'package:flutter_clean/features/character/domain/repositories/character_repository.dart';

class GetStoriesByCharacterUseCase {
  GetStoriesByCharacterUseCase({
    required this.characterRepository,
  });

  late final CharacterRepository characterRepository;

  Future<List<Story>?> execute({required int characterId}) {
    return characterRepository.getCharacterStories(characterId: characterId);
  }
}
