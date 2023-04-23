
import 'package:flutter_clean/features/character/data/datasources/remote_datasource.dart';
import 'package:flutter_clean/features/character/domain/entities/comic.dart';
import 'package:flutter_clean/features/character/domain/repositories/comic_repository.dart';

class ComicRepositoryImpl implements ComicRepository {
  ComicRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  @override
  Future<List<Comic>?> getComics(int offset, int limit) {
    return remoteDataSource.getComics(offset, limit);
  }
  
  @override
  Future<Comic?> getComicById({required int id}) {
    throw UnimplementedError();
  }
}
