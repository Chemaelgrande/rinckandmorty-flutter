import 'package:get/get.dart';

import '../controllers/character_details_controller.dart';

class CharacterDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterDetailsController>(
      () => CharacterDetailsController(),
    );
  }
}
