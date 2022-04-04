import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/data/models/character_model.dart';
import 'package:rickandmorty/app/modules/character/controllers/episode_controller.dart';
import 'package:rickandmorty/app/theme/app_fonts.dart';
import 'package:rickandmorty/app/widgets/card_information_episode.dart';

class LoadEpisodesWidget extends StatelessWidget {
  final Character character;
  const LoadEpisodesWidget({Key? key, required this.character})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    EpisodeController episodeController = Get.find();
    return GetBuilder<EpisodeController>(
      initState: (_) async {
        episodeController.episodesCharacter.value.clear();
        await episodeController.getEpisodeCharacter(character);
      },
      builder: (_) => Obx(
        () => ListView(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            GridView.builder(
              padding: EdgeInsets.zero,
              itemCount: (episodeController.episodesCharacter.value.length <
                      episodeController.incrementList.value)
                  ? episodeController.episodesCharacter.value.length
                  : episodeController.incrementList.value,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1.5,
              ),
              itemBuilder: (context, index) {
                return CardInformationEpisode(
                  title: episodeController.episodesCharacter.value[index].name!,
                  description:
                      episodeController.episodesCharacter.value[index].episode!,
                  date:
                      episodeController.episodesCharacter.value[index].airDate!,
                );
              },
            ),
            Obx(
              () => Padding(
                padding: const EdgeInsets.only(top: 30.0, bottom: 30),
                child: Center(
                  child: (episodeController.episodesCharacter.value.length >
                          episodeController.incrementList.value)
                      ? GestureDetector(
                          onTap: () {
                            episodeController.incrementList.value =
                                episodeController.incrementList.value + 4;
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "Ver mas",
                              style: TEXT_THEME_BLACK.button,
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
    );
  }
}
