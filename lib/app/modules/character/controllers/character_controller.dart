import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/data/models/character_model.dart';
import 'package:rickandmorty/app/data/models/episode_model.dart';
import 'package:rickandmorty/app/data/providers/character_provider.dart';
import 'package:rickandmorty/app/data/providers/episode_provider.dart';

class CharacterController extends GetxController {
  var page = 0.obs;
  var isLoading = false.obs;
  var nameSearchCharacter = ''.obs;
  var statusSearchCharacter = ''.obs;
  var genderSearchCharacter = ''.obs;

  TextEditingController searchQueryController = TextEditingController();
  Rx<bool> isSearching = false.obs;
  late FocusNode myFocusNode;

  final _characters = <Character>[].obs;
  List<Character> get characters => _characters.toList();

  final _searchCharacters = <Character>[].obs;
  List<Character> get searchCharacters => _searchCharacters.toList();

  final _interesatCharacters = <Character>[].obs;
  List<Character> get interesatCharacters => _interesatCharacters.toList();

  final CharacterProvider characterProvider;

  CharacterController(this.characterProvider);

  @override
  void onInit() {
    myFocusNode = FocusNode();
    ever(page, (_) => _getAllCharacters());
    // ever(nameSearchCharacter, (_) => getAllSearchCharacters());
    page++;
    super.onInit();
  }

  Future<void> _getAllCharacters() async {
    isLoading.value = true;
    try {
      final response =
          await characterProvider.getCharacterPage(pageNumber: page.value);

      _characters.addAll(response.body!);
    } catch (e) {
      log("$e");
    }
    isLoading.value = false;
  }

  Future<void> getAllSearchCharacters(String newQuery) async {
    _searchCharacters.clear();
    isLoading.value = true;
    isSearching.value = true;
    nameSearchCharacter.value = newQuery;
    try {
      final response = await characterProvider.getCharacterName(
          name: nameSearchCharacter.value);

      _searchCharacters.addAll(response.body!);

      update();
    } catch (e) {
      log("$e");
    }
    isLoading.value = false;
  }

  void next() => page++;

  void clearSearchCharacters(context) {
    nameSearchCharacter.value = '';
    searchQueryController.clear();
    getAllSearchCharactersByCategory();
    FocusScope.of(context).requestFocus(new FocusNode());
    isSearching.value = false;
  }

  Future<void> getAllSearchCharactersByCategory() async {
    isLoading.value = true;

    try {
      final response = await characterProvider.getCharacterByCategory(
        name: nameSearchCharacter.value,
        status: (statusSearchCharacter.value == "unknown1" ||
                statusSearchCharacter.value == "unknown2")
            ? "unknown"
            : statusSearchCharacter.value,
        gender: genderSearchCharacter.value,
      );
      _searchCharacters.clear();
      _searchCharacters.addAll(response.body!);
      print(_searchCharacters);

      update();
    } catch (e) {
      log("$e");
    }
    isLoading.value = false;
  }

  Future<void> getFavourteCharactersByCategory() async {
    isLoading.value = true;
    _interesatCharacters.clear();
    try {
      for (var i = 1; i < 4; i++) {
        final response = await characterProvider.getCharacterById(
          id: i.toString(),
        );
        print(response);
        _interesatCharacters.add(response.body!);
        print(_interesatCharacters);

        update();
      }
    } catch (e) {
      log("$e");
    }
    isLoading.value = false;
  }

  void clearListCharacters(context) {
    _searchCharacters.clear();
  }
}
