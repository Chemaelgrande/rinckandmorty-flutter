import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/data/models/character_model.dart';
import 'package:rickandmorty/app/modules/character/controllers/episode_controller.dart';
import 'package:rickandmorty/app/theme/app_colors.dart';
import 'package:rickandmorty/app/theme/app_fonts.dart';
import 'package:rickandmorty/app/widgets/background_image.dart';
import 'package:rickandmorty/app/widgets/card_information_character.dart';
import 'package:rickandmorty/app/widgets/card_information_episode.dart';
import 'package:rickandmorty/app/widgets/top_details_character_widget.dart';

class CharacterDetailsView extends GetView {
  CharacterDetailsView({Key? key}) : super(key: key);
  final Character character = Get.arguments;

  @override
  Widget build(BuildContext context) {
    EpisodeController episodeController = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Container(
            color: AppColors.COLOR_WHITE,
            child: ListView(
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
                        child: GetBuilder<EpisodeController>(
                          initState: (_) async {
                            episodeController.episodesCharacter.value.clear();
                            episodeController.getEpisodeCharacter(character);
                          },
                          builder: (_) => Obx(
                            () => ListView(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              children: [
                                GridView.builder(
                                  padding: EdgeInsets.zero,
                                  itemCount: (episodeController
                                              .episodesCharacter.value.length <
                                          episodeController.incrementList.value)
                                      ? episodeController
                                          .episodesCharacter.value.length
                                      : episodeController.incrementList.value,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 20,
                                    crossAxisSpacing: 20,
                                    childAspectRatio: 1.5,
                                  ),
                                  itemBuilder: (context, index) {
                                    return CardInformationEpisode(
                                      title: episodeController
                                          .episodesCharacter.value[index].name!,
                                      description: episodeController
                                          .episodesCharacter
                                          .value[index]
                                          .episode!,
                                      date: episodeController.episodesCharacter
                                          .value[index].airDate!,
                                    );
                                  },
                                ),
                                Obx(
                                  () => Padding(
                                    padding: const EdgeInsets.only(top: 30.0),
                                    child: Center(
                                      child: (episodeController
                                                  .episodesCharacter
                                                  .value
                                                  .length >
                                              episodeController
                                                  .incrementList.value)
                                          ? GestureDetector(
                                              onTap: () {
                                                episodeController.incrementList
                                                    .value = episodeController
                                                        .incrementList.value +
                                                    4;
                                              },
                                              child: Container(
                                                padding: EdgeInsets.all(10),
                                                child: Text(
                                                  "Ver mas",
                                                  style:
                                                      TEXT_THEME_BLACK.button,
                                                ),
                                              ),
                                            )
                                          : Container(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
