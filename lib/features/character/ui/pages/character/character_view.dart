import 'package:flutter/material.dart';
import 'package:flutter_clean/features/character/ui/constants/text_styles.dart';
import 'package:flutter_clean/features/character/ui/pages/character/character_view_model.dart';
import 'package:flutter_clean/features/character/ui/constants/app_colors.dart';
import 'package:flutter_clean/features/character/utils/states.dart';
import 'package:flutter_clean/features/character/ui/widgets/image_item.dart';
import 'package:flutter_clean/features/character/ui/widgets/image_list.dart';
import 'package:get/get.dart';

class CharacterView extends StatelessWidget {
  CharacterView({Key? key}) : super(key: key);

  final CharacterViewModel controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              controller.state.value == States.LOADING
                  ? _loadingWidget()
                  : controller.state.value == States.ERROR
                      ? _errorWidget()
                      : _bodyWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget _loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _errorWidget() {
    return const Center(
      child: Text("Ups.. Ocurrió un error. ¡Intenta de nuevo!"),
    );
  }

  Widget _bodyWidget() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.network("${controller.character.value?.thumbnailURI}"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text("${controller.character.value?.name}",
                      style: primaryTextStyle),
                  const SizedBox(height: 12),
                  Text("${controller.character.value?.description}",
                      textAlign: TextAlign.justify, style: secondaryTextStyle),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Comics",
                      style: primaryTextStyle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => ImageList(
                      width: 150,
                      height: 260,
                      isLoading: controller.stateComics.value == States.LOADING,
                      imageItems: controller.comics
                          .map((e) => ImageItem(
                                id: e.id,
                                imageURI: e.thumbnailURI,
                                title: e.title,
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Series",
                      style: primaryTextStyle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => ImageList(
                      width: 150,
                      height: 260,
                      isLoading: controller.stateSeries.value == States.LOADING,
                      imageItems: controller.series
                          .map((e) => ImageItem(
                                id: e.id,
                                imageURI: e.thumbnailURI,
                                title: e.title,
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Events",
                      style: primaryTextStyle,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(
                    () => ImageList(
                      width: 150,
                      height: 260,
                      isLoading: controller.stateEvents.value == States.LOADING,
                      imageItems: controller.events
                          .map((e) => ImageItem(
                                id: e.id,
                                imageURI: e.thumbnailURI,
                                title: e.title,
                              ))
                          .toList(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Stories",
                      style: primaryTextStyle,
                    ),
                  ),
                  Obx(
                    () => ImageList(
                      width: 150,
                      height: 260,
                      isLoading:
                          controller.stateStories.value == States.LOADING,
                      imageItems: controller.stories
                          .map((e) => ImageItem(
                                id: e.id,
                                imageURI:
                                    "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png",
                                title: e.title,
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
