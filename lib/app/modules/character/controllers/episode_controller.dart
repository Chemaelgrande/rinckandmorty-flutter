import 'dart:developer';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:rickandmorty/app/data/models/character_model.dart';
import 'package:rickandmorty/app/data/models/episode_model.dart';
import 'package:rickandmorty/app/data/providers/episode_provider.dart';
import 'package:rickandmorty/app/modules/character/controllers/character_controller.dart';

class EpisodeController extends GetxController {
  final EpisodeProvider episodeProvider;

  Rx<List<Episode>> episodesCharacter = Rx<List<Episode>>([]);

  Rx<int> incrementList = 4.obs;

  EpisodeController(this.episodeProvider);
  Future<void> getEpisodeCharacter(
    Character character,
  ) async {
    CharacterController characterController = Get.find();

    print(episodesCharacter.value);

    for (int i = 0; i < character.episode!.length; i++) {
      try {
        Response response =
            await episodeProvider.getEpisode(character.episode![i]);

        var responseEpisode = response.body;
        episodesCharacter.value.add(Episode.fromJson(responseEpisode));

        print(episodesCharacter.value);
        episodesCharacter.refresh();
      } catch (e) {
        log("$e");
      }
    }
  }
}
