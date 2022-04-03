import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/modules/character/controllers/character_controller.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';

class PopupmenuButtonWidget extends StatelessWidget {
  const PopupmenuButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterController characterController = Get.find();
    return PopupMenuButton<String>(
      icon: const Icon(
        Icons.menu,
        color: AppColors.COLOR_WHITE,
      ),
      onSelected: (String result) {
        switch (result) {
          case 'clearFilters':
            characterController.genderSearchCharacter.value = '';
            characterController.statusSearchCharacter.value = '';
            characterController.clearSearchCharacters(context);
            break;
          default:
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'clearFilters',
          child: Text('Clear filters'),
        ),
      ],
    );
  }
}
