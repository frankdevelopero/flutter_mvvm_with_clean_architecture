
import 'package:flutter_clean/features/character/domain/entities/character.dart';
import 'package:flutter_clean/features/character/domain/repositories/character_repository.dart';

class GetCharactersUseCase {
  GetCharactersUseCase({
    required this.characterRepository,
  });

  late final CharacterRepository characterRepository;

  Future<List<Character>?> execute(int offset, int limit) async {
    return await characterRepository.getCharacters(offset, limit);
  }
}
