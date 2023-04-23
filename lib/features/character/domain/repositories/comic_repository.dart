
import 'package:flutter_clean/features/character/domain/entities/comic.dart';

abstract class ComicRepository {
  Future<List<Comic>?> getComics(int offset, int limit);
  Future<Comic?> getComicById({required int id});
}
