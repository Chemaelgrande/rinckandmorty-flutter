import 'package:get/get.dart';

import '../modules/character/bindings/character_binding.dart';
import '../modules/character/views/character_view.dart';
import '../modules/character_details/bindings/character_details_binding.dart';
import '../modules/character_details/views/character_details_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CHARACTER,
      page: () => CharacterView(),
      binding: CharacterBinding(),
    ),
    GetPage(
      name: _Paths.CHARACTER_DETAILS,
      page: () => CharacterDetailsView(),
      binding: CharacterDetailsBinding(),
    ),
  ];
}
