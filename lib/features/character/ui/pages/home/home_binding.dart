import 'package:flutter_clean/features/character/data/api/api_datasource.dart';
import 'package:flutter_clean/features/character/data/datasources/remote_datasource.dart';
import 'package:flutter_clean/features/character/data/repositories/character_repository_impl.dart';
import 'package:flutter_clean/features/character/domain/repositories/character_repository.dart';
import 'package:flutter_clean/features/character/domain/usecase/get_characters_use_case.dart';
import 'package:flutter_clean/features/character/ui/pages/home/home_view_model.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RemoteDataSource>(() => ApiDataSource());
    Get.lazyPut<CharacterRepository>(
        () => CharacterRepositoryImpl(remoteDataSource: Get.find()));
    Get.lazyPut(() => GetCharactersUseCase(characterRepository: Get.find()));
    Get.lazyPut(() => HomeViewModel(getCharactersUseCase: Get.find()));
  }
}
