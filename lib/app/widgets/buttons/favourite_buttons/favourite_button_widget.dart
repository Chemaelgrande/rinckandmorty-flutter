import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/data/models/character_model.dart';
import 'package:rickandmorty/app/modules/character/controllers/character_controller.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteButtonWidget extends StatefulWidget {
  final Character character;
  const FavouriteButtonWidget({Key? key, required this.character})
      : super(key: key);

  @override
  State<FavouriteButtonWidget> createState() => _FavouriteButtonWidgetState();
}

class _FavouriteButtonWidgetState extends State<FavouriteButtonWidget> {
  @override
  Widget build(BuildContext context) {
    CharacterController characterController = Get.find();
    return GestureDetector(
      onTap: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();

        if (widget.character.isFavourite != null) {
          widget.character.isFavourite = !widget.character.isFavourite!;
        } else {
          widget.character.isFavourite = true;
        }

        await characterController.getFavourites();

        Character? findCharacter =
            characterController.findCharacter(widget.character.id!);

        if (findCharacter == null) {
          characterController.addCharacterToList(widget.character);

          await prefs.setString("favouritesCharacters",
              jsonEncode(characterController.favouritesCharacters));
        } else {
          characterController.removeCharacterToList(widget.character);

          await prefs.setString("favouritesCharacters",
              jsonEncode(characterController.favouritesCharacters));
        }

        await characterController.refreshInteresantCharacter();

        await characterController.refreshFavouriteCharacter();

        setState(() {});
      },
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.COLOR_LIGHT_GREY,
          shape: BoxShape.circle,
        ),
        height: 36,
        width: 36,
        child: Icon(
          Icons.star,
          size: 20,
          color: (widget.character.isFavourite == true)
              ? Colors.yellow
              : Colors.white,
        ),
      ),
    );
  }
}
