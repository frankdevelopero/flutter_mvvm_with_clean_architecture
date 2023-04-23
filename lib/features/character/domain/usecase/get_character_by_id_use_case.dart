
import 'package:flutter_clean/features/character/domain/entities/character.dart';
import 'package:flutter_clean/features/character/domain/repositories/character_repository.dart';

class GetCharacterByIdUseCase {
  GetCharacterByIdUseCase({
    required this.characterRepository,
  });

  late final CharacterRepository characterRepository;
  Future<Character?> execute(int id) {
    return characterRepository.getCharacterBy(id: id);
  }
}
