import 'package:flutter_clean/features/character/ui/pages/character/character_binding.dart';
import 'package:flutter_clean/features/character/ui/pages/character/character_view.dart';
import 'package:flutter_clean/features/character/ui/pages/home/home_binding.dart';
import 'package:flutter_clean/features/character/ui/pages/home/home_view.dart';
import 'package:get/get.dart';

class RouterApp {
  static const home = "/home";
  static const characterDetail = "/character_detail";

  static List<GetPage> pages = [
    GetPage(
      name: home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: characterDetail,
      page: () => CharacterView(),
      binding: CharacterBinding(),
    ),
  ];
}
