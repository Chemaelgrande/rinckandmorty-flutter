import 'package:get/get.dart';
import 'package:rickandmorty/app/data/providers/character_provider.dart';

import '../controllers/character_controller.dart';

class CharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterProvider>(
      () => CharacterProvider(),
    );

    Get.lazyPut<CharacterController>(
      () => CharacterController(
        Get.find(),
      ),
    );
  }
}
