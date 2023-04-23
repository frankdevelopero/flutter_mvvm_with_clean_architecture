import 'package:flutter/material.dart';
import 'package:flutter_clean/features/character/ui/constants/text_styles.dart';
import 'package:flutter_clean/features/character/ui/pages/home/home_view_model.dart';
import 'package:flutter_clean/features/character/ui/pages/home/widgets/character_unit.dart';
import 'package:flutter_clean/features/character/ui/constants/app_colors.dart';
import 'package:flutter_clean/features/character/utils/states.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final HomeViewModel controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: Column(
          children: [_header(), _body()],
        ),
      ),
    );
  }

  Widget _header() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Text(
        "Marvel Characters",
        style: primaryTextStyle,
      ),
    );
  }

  Widget _body() {
    return Obx(
      () => Expanded(
        child: Container(
            child: controller.state.value == States.LOADING
                ? _loadingWidget()
                : controller.state.value == States.ERROR
                    ? _errorWidget()
                    : _dataWidget()),
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
      child: Text("Ups.. Ocurrió un error. ¡Intentalo de nuevo!."),
    );
  }

  Widget _dataWidget() {
    return GridView.builder(
      shrinkWrap: true,
      itemCount: controller.characters.length,
      controller: controller.scrollController,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
      ),
      itemBuilder: (context, index) {
        if (index >= controller.characters.length - 1) {
          return const Center(child: CircularProgressIndicator());
        }

        return CharacterUnit(
          id: controller.characters[index].id,
          imageURI: controller.characters[index].thumbnailURI,
          title: controller.characters[index].name,
          onTap: (id) {
            controller.goToCharacterPage(id);
          },
        );
      },
    );
  }
}
