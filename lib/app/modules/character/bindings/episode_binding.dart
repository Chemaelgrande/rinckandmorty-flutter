import 'package:get/get.dart';
import 'package:rickandmorty/app/data/providers/episode_provider.dart';
import 'package:rickandmorty/app/modules/character/controllers/episode_controller.dart';

class EpisodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EpisodeProvider>(
      () => EpisodeProvider(),
    );

    Get.lazyPut<EpisodeController>(
      () => EpisodeController(
        Get.find(),
      ),
    );
  }
}
