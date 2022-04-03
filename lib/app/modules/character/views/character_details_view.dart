import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rickandmorty/app/data/models/character_model.dart';
import 'package:rickandmorty/app/theme/app_fonts.dart';
import 'package:rickandmorty/app/widgets/card_information_character.dart';
import 'package:rickandmorty/app/widgets/top_details_character_widget.dart';

class CharacterDetailsView extends GetView {
  CharacterDetailsView({Key? key}) : super(key: key);
  final Character character = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          TopDetailsCharacterWidget(
            character: character,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Informacion",
                  style: TEXT_THEME_BLACK.headline2,
                ),
                GridView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CardInformationCharacter(
                      title: "Gender:",
                      description: character.gender!,
                    ),
                    CardInformationCharacter(
                      title: "Origin",
                      description: character.origin!.name!,
                    ),
                    CardInformationCharacter(
                      title: "Type",
                      description: character.status!,
                    ),
                  ],
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 2.5,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
