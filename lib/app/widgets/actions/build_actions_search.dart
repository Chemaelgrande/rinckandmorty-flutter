import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rickandmorty/app/modules/character/controllers/character_controller.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';

class BuildActionsSearch extends StatelessWidget {
  const BuildActionsSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterController characterController = Get.find();
    return Obx(
      () => (characterController.isSearching.value)
          ? IconButton(
              icon: const Icon(
                Icons.clear,
                color: AppColors.COLOR_WHITE,
              ),
              onPressed: () {
                if (characterController.searchQueryController.text.isEmpty) {
                  Navigator.pop(context);
                  return;
                }
                characterController.clearSearchCharacters(context);
              },
            )
          : IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: AppColors.COLOR_WHITE,
              ),
            ),
    );
  }
}
