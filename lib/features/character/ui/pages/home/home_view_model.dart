import 'package:flutter/material.dart';
import 'package:flutter_clean/features/character/domain/entities/character.dart';
import 'package:flutter_clean/features/character/domain/usecase/get_characters_use_case.dart';
import 'package:flutter_clean/features/character/ui/router_app.dart';
import 'package:get/get.dart';
import 'package:flutter_clean/features/character/utils/states.dart';

class HomeViewModel extends GetxController {
  HomeViewModel({
    required this.getCharactersUseCase,
  });

  late final GetCharactersUseCase getCharactersUseCase;

  Rx<States> state = Rx(States.LOADING);
  Rx<States> stateAddItems = Rx(States.SUCCESS);
  RxList<Character> characters = RxList();

  ScrollController scrollController = ScrollController();

  int offset = 0;

  @override
  void onReady() {
    super.onReady();

    scrollController.addListener(() {
      if (stateAddItems.value != States.LOADING &&
          scrollController.offset >= scrollController.position.maxScrollExtent) {
        stateAddItems.value = States.LOADING;
        offset += 10;
        _getCharacters();
      }
    });

    _getCharacters();
  }

  void _getCharacters() async {
    final List<Character>? list = await getCharactersUseCase.execute(offset, 10);

    if (list != null) {
      characters.addAll(list);
      state.value = States.SUCCESS;
      stateAddItems.value = States.SUCCESS;
    }
  }

  void goToCharacterPage(int id) {
    Get.toNamed(
      RouterApp.characterDetail,
      arguments: {"id": id},
    );
  }
}
