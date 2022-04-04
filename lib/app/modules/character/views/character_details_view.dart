import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/data/models/character_model.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';
import 'package:rickandmorty/app/theme/app_fonts.dart';
import 'package:rickandmorty/app/widgets/layout/background_image.dart';
import 'package:rickandmorty/app/widgets/buttons/button_widget.dart';
import 'package:rickandmorty/app/widgets/cards/card_information_character.dart';
import 'package:rickandmorty/app/widgets/actions/load_episodes_widget.dart';
import 'package:rickandmorty/app/widgets/actions/load_interesant_character.dart';
import 'package:rickandmorty/app/widgets/layout/top_details_character_widget.dart';

class CharacterDetailsView extends GetView {
  CharacterDetailsView({Key? key}) : super(key: key);
  final Character character = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          ListView(
            padding: EdgeInsets.zero,
            children: [
              TopDetailsCharacterWidget(
                character: character,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 40.0,
                ),
                color: AppColors.COLOR_WHITE,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Informacion",
                      style: TEXT_THEME_BLACK.headline2,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GridView(
                      padding: EdgeInsets.zero,
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
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 2.5,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Episodios",
                      style: TEXT_THEME_BLACK.headline2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: LoadEpisodesWidget(
                        character: character,
                      ),
                    ),
                    Text(
                      "Personajes interesantes",
                      style: TEXT_THEME_BLACK.headline2,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: LoadInteresantCharacter(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Center(
                        child: ButtonWidget(
                          text: "Compartir personaje",
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ],
      ),
    );
  }
}
