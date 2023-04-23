import 'package:flutter_clean/features/character/domain/entities/event.dart';
import 'package:flutter_clean/features/character/domain/repositories/character_repository.dart';

class GetEventsByCharacterUseCase {
  GetEventsByCharacterUseCase({
    required this.characterRepository,
  });

  late final CharacterRepository characterRepository;

  Future<List<Event>?> execute({required int characterId}) {
    return characterRepository.getCharacterEvents(characterId: characterId);
  }
}
