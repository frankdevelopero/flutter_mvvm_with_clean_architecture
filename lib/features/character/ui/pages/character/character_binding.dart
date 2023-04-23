import 'package:flutter_clean/features/character/data/api/api_datasource.dart';
import 'package:flutter_clean/features/character/data/datasources/remote_datasource.dart';
import 'package:flutter_clean/features/character/data/repositories/character_repository_impl.dart';
import 'package:flutter_clean/features/character/domain/repositories/character_repository.dart';
import 'package:flutter_clean/features/character/domain/usecase/get_character_by_id_use_case.dart';
import 'package:flutter_clean/features/character/domain/usecase/get_comics_by_character_use_case.dart';
import 'package:flutter_clean/features/character/domain/usecase/get_events_by_character_use_case.dart';
import 'package:flutter_clean/features/character/domain/usecase/get_series_by_character_use_case.dart';
import 'package:flutter_clean/features/character/domain/usecase/get_stories_by_character_use_case.dart';
import 'package:flutter_clean/features/character/ui/pages/character/character_view_model.dart';
import 'package:get/get.dart';

class CharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteDataSource>(() => ApiDataSource());

    Get.lazyPut<CharacterRepository>(
        () => CharacterRepositoryImpl(remoteDataSource: Get.find()));

    Get.lazyPut(() => GetCharacterByIdUseCase(characterRepository: Get.find()));

    Get.lazyPut(
        () => GetComicsByCharacterUseCase(characterRepository: Get.find()));

    Get.lazyPut(
        () => GetEventsByCharacterUseCase(characterRepository: Get.find()));

    Get.lazyPut(
        () => GetSeriesByCharacterUseCase(characterRepository: Get.find()));

    Get.lazyPut(
        () => GetStoriesByCharacterUseCase(characterRepository: Get.find()));

    Get.lazyPut(() => CharacterViewModel(
          getCharacterByIdUseCase: Get.find(),
          getCharacterComicsUseCase: Get.find(),
          getCharacterEventsUseCase: Get.find(),
          getCharacterSeriesUseCase: Get.find(),
          getCharacterStoriesUseCase: Get.find(),
        ));
  }
}
