import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/modules/character/controllers/character_controller.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';
import 'package:rickandmorty/app/theme/app_fonts.dart';

class TextSearchField extends StatelessWidget {
  const TextSearchField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterController characterController = Get.find();

    return SizedBox(
      width: 150,
      child: TextField(
        focusNode: characterController.myFocusNode,
        controller: characterController.searchQueryController,
        autofocus: false,
        decoration: InputDecoration(
          hintText: "Buscar personaje...",
          border: InputBorder.none,
          hintStyle:
              TEXT_THEME_WHITE.bodyText2!.copyWith(color: AppColors.COLOR_GREY),
        ),
        style: TEXT_THEME_WHITE.bodyText2,
        onChanged: (query) => characterController.getAllSearchCharacters(query),
      ),
    );
  }
}
