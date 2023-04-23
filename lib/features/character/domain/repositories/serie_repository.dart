

import 'package:flutter_clean/features/character/domain/entities/serie.dart';

abstract class SerieRepository {
  Future<List<Serie>?> getSeries(int offset, int limit);
}
