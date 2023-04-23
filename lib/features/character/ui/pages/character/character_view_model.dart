
import 'package:flutter_clean/features/character/domain/entities/character.dart';
import 'package:flutter_clean/features/character/domain/entities/comic.dart';
import 'package:flutter_clean/features/character/domain/entities/event.dart';
import 'package:flutter_clean/features/character/domain/entities/serie.dart';
import 'package:flutter_clean/features/character/domain/entities/story.dart';
import 'package:flutter_clean/features/character/domain/usecase/get_character_by_id_use_case.dart';
import 'package:flutter_clean/features/character/domain/usecase/get_comics_by_character_use_case.dart';
import 'package:flutter_clean/features/character/domain/usecase/get_events_by_character_use_case.dart';
import 'package:flutter_clean/features/character/domain/usecase/get_series_by_character_use_case.dart';
import 'package:flutter_clean/features/character/domain/usecase/get_stories_by_character_use_case.dart';
import 'package:flutter_clean/features/character/utils/states.dart';
import 'package:get/get.dart';

class CharacterViewModel extends GetxController {
  CharacterViewModel({
    required this.getCharacterByIdUseCase,
    required this.getCharacterComicsUseCase,
    required this.getCharacterEventsUseCase,
    required this.getCharacterSeriesUseCase,
    required this.getCharacterStoriesUseCase,
  });

  final GetCharacterByIdUseCase getCharacterByIdUseCase;
  final GetComicsByCharacterUseCase getCharacterComicsUseCase;
  final GetEventsByCharacterUseCase getCharacterEventsUseCase;
  final GetSeriesByCharacterUseCase getCharacterSeriesUseCase;
  final GetStoriesByCharacterUseCase getCharacterStoriesUseCase;

  Rx<States> state = Rx(States.LOADING);
  Rxn<Character> character = Rxn();

  Rx<States> stateComics = Rx(States.LOADING);
  RxList<Comic> comics = RxList();

  Rx<States> stateSeries = Rx(States.LOADING);
  RxList<Serie> series = RxList();

  Rx<States> stateStories = Rx(States.LOADING);
  RxList<Story> stories = RxList();

  Rx<States> stateEvents = Rx(States.LOADING);
  RxList<Event> events = RxList();

  @override
  void onReady() {
    super.onReady();

    if (Get.arguments != null && Get.arguments["id"] != null) {
      final int id = Get.arguments["id"];

      _getCharacterById(id);
      _getCharacterComics(id);
      _getCharacterSeries(id);
      _getCharacterStories(id);
      _getCharacterEvents(id);
    } else {
      state.value = States.ERROR;
    }
  }

  void _getCharacterById(int id) async {
    final Character? char = await getCharacterByIdUseCase.execute(id);

    if (char == null) {
      state.value = States.ERROR;
      return;
    }

    character.value = char;

    state.value = States.SUCCESS;
  }

  void _getCharacterComics(int id) async {
    final List<Comic>? list = await getCharacterComicsUseCase.execute(characterId: id);

    if (list == null) {
      stateComics.value = States.ERROR;
      return;
    }

    comics.clear();
    comics.addAll(list);
    stateComics.value = States.SUCCESS;
  }

  void _getCharacterSeries(int id) async {
    final List<Serie>? list = await getCharacterSeriesUseCase.execute(characterId: id);

    if (list == null) {
      stateSeries.value = States.ERROR;
      return;
    }

    series.clear();
    series.addAll(list);
    stateSeries.value = States.SUCCESS;
  }

  void _getCharacterStories(int id) async {
    final List<Story>? list = await getCharacterStoriesUseCase.execute(characterId: id);

    if (list == null) {
      stateStories.value = States.ERROR;
      return;
    }

    stories.clear();
    stories.addAll(list);
    stateStories.value = States.SUCCESS;
  }

  void _getCharacterEvents(int id) async {
    final List<Event>? list = await getCharacterEventsUseCase.execute(characterId: id);

    if (list == null) {
      stateEvents.value = States.ERROR;
      return;
    }

    events.clear();
    events.addAll(list);
    stateEvents.value = States.SUCCESS;
  }
}
