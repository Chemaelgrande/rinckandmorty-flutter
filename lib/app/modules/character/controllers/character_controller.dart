import 'package:get/get.dart';
import 'package:rickandmorty/app/data/models/character_model.dart';
import 'package:rickandmorty/app/data/providers/character_provider.dart';

class CharacterController extends GetxController {
  var page = 0.obs;
  var isLoading = false.obs;

  final _characters = <Character>[].obs;
  List<Character> get characters => _characters.toList();

  final CharacterProvider characterProvider;

  CharacterController(this.characterProvider);

  @override
  void onInit() {
    ever(page, (_) => _getAllCharacters());
    page++;
    super.onInit();
  }

  Future<void> _getAllCharacters() async {
    isLoading.value = true;
    try {
      final response =
          await characterProvider.getCharacterPage(pageNumber: page.value);

      _characters.addAll(response.body!);
      print(response.body!);
    } catch (e) {
      print(e);
    }
    isLoading.value = false;
  }

  void next() => page++;
}
