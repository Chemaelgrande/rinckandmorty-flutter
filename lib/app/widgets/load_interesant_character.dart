import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/modules/character/controllers/character_controller.dart';
import 'package:rickandmorty/app/routes/app_pages.dart';
import 'package:rickandmorty/app/widgets/card_character.dart';

class LoadInteresantCharacter extends StatelessWidget {
  const LoadInteresantCharacter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterController characterController = Get.find();
    return Obx(
      () => (characterController.interesatCharacters.isNotEmpty)
          ? ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: characterController.interesatCharacters.length,
              itemBuilder: (context, index) => CardCharacter(
                character: characterController.interesatCharacters[index],
                onTap: () {
                  Get.back();
                  Get.toNamed(
                    Routes.CHARACTER_DETAILS,
                    arguments: characterController.interesatCharacters[index],
                  );
                },
              ),
            )
          : Container(
              color: Colors.green,
              height: 200,
            ),
    );
  }
}
