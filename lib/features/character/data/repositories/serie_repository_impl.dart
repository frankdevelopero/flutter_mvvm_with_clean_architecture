

import 'package:flutter_clean/features/character/data/datasources/remote_datasource.dart';
import 'package:flutter_clean/features/character/domain/entities/serie.dart';
import 'package:flutter_clean/features/character/domain/repositories/serie_repository.dart';

class SerieRepositoryImpl implements SerieRepository {
  SerieRepositoryImpl({
    required this.remoteDataSource,
  });

  final RemoteDataSource remoteDataSource;

  @override
  Future<Serie> getSerieBy({required int id}) {
    // TODO: implement getSerieBy
    throw UnimplementedError();
  }

  @override
  Future<List<Serie>?> getSeries(int offset, int limit) {
    return remoteDataSource.getSeries(offset, limit);
  }
}
