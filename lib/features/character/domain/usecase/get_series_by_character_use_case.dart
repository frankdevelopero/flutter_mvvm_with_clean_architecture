import 'package:flutter_clean/features/character/domain/entities/serie.dart';
import 'package:flutter_clean/features/character/domain/repositories/character_repository.dart';

class GetSeriesByCharacterUseCase {
  GetSeriesByCharacterUseCase({
    required this.characterRepository,
  });

  late final CharacterRepository characterRepository;

  Future<List<Serie>?> execute({required int characterId}) {
    return characterRepository.getCharacterSeries(characterId: characterId);
  }
}
