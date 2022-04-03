import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/data/models/character_model.dart';
import 'package:rickandmorty/app/data/providers/character_provider.dart';

class CharacterController extends GetxController {
  var page = 0.obs;
  var isLoading = false.obs;
  var nameSearchCharacter = ''.obs;

  TextEditingController searchQueryController = TextEditingController();
  Rx<bool> isSearching = false.obs;
  late FocusNode myFocusNode;

  final _characters = <Character>[].obs;
  List<Character> get characters => _characters.toList();

  final _searchCharacters = <Character>[].obs;
  List<Character> get searchCharacters => _searchCharacters.toList();

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
    isLoading.value = true;
    isSearching.value = true;
    nameSearchCharacter.value = newQuery;
    try {
      final response = await characterProvider.getCharacterName(
          name: nameSearchCharacter.value);
      _searchCharacters.clear();
      _searchCharacters.addAll(response.body!);

      update();
    } catch (e) {
      log("$e");
    }
    isLoading.value = false;
  }

  void next() => page++;

  void clearSearchCharacters(context) {
    searchQueryController.clear();
    FocusScope.of(context).requestFocus(new FocusNode());
    isSearching.value = false;
    _searchCharacters.clear();
  }
}
