import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rickandmorty/app/data/models/character_model.dart';
import 'package:rickandmorty/app/data/providers/character_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CharacterController extends GetxController {
  var page = 0.obs;
  var isLoading = false.obs;
  var nameSearchCharacter = ''.obs;
  var statusSearchCharacter = ''.obs;
  var genderSearchCharacter = ''.obs;
  RxBool isFavourite = false.obs;
  RxBool listIsFavorite = false.obs;

  TextEditingController searchQueryController = TextEditingController();
  Rx<bool> isSearching = false.obs;
  late FocusNode myFocusNode;

  final _characters = <Character>[].obs;
  List<Character> get characters => _characters.toList();

  final _searchCharacters = <Character>[].obs;
  List<Character> get searchCharacters => _searchCharacters.toList();

  final _interesatCharacters = <Character>[].obs;
  List<Character> get interesatCharacters => _interesatCharacters.toList();

  final _favouritesCharacters = <Character>[].obs;
  List<Character> get favouritesCharacters => _favouritesCharacters.toList();

  final CharacterProvider characterProvider;

  CharacterController(this.characterProvider);

  @override
  void onInit() async {
    myFocusNode = FocusNode();
    ever(page, (_) => _getAllCharacters());
    page++;
    super.onInit();
  }

  //GEt ALL CHARACTERS PER PAGE
  Future<void> _getAllCharacters() async {
    isLoading.value = true;
    try {
      final response =
          await characterProvider.getCharacterPage(pageNumber: page.value);

      _characters.addAll(response.body!);

      await getFavourites();
      for (var i = 0; i < _favouritesCharacters.length; i++) {
        _characters
            .removeWhere((book) => book.id == _favouritesCharacters[i].id);

        _characters.insert(0, _favouritesCharacters[i]);
      }
    } catch (e) {
      log("$e");
    }
    isLoading.value = false;
  }

  //GET CHARACTERS BY FILTERS
  Future<void> getAllSearchCharacters(String newQuery) async {
    _searchCharacters.clear();
    isLoading.value = true;
    isSearching.value = true;
    nameSearchCharacter.value = newQuery;
    try {
      final response = await characterProvider.getCharacterName(
          name: nameSearchCharacter.value);

      _searchCharacters.addAll(response.body!);

      for (var i = 0; i < _favouritesCharacters.length; i++) {
        Character findElement = _favouritesCharacters
            .firstWhere((element) => element.id == _searchCharacters[i].id);
        _searchCharacters
            .removeWhere((element) => element.id == findElement.id);
        _searchCharacters.insert(0, findElement);
      }

      update();
    } catch (e) {
      log("$e");
    }
    isLoading.value = false;
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
      for (var i = 0; i < _favouritesCharacters.length; i++) {
        Character findElement = _favouritesCharacters
            .firstWhere((element) => element.id == _searchCharacters[i].id);
        _searchCharacters
            .removeWhere((element) => element.id == findElement.id);
        _searchCharacters.insert(0, findElement);
      }

      update();
    } catch (e) {
      log("$e");
    }
    isLoading.value = false;
  }

  void next() => page++;

  //CLEAR FILTERS
  void clearSearchCharacters(context) {
    nameSearchCharacter.value = '';
    searchQueryController.clear();

    if (statusSearchCharacter.value != '' ||
        genderSearchCharacter.value != '' ||
        nameSearchCharacter.value != '') {
      getAllSearchCharactersByCategory();
    } else {
      _searchCharacters.clear();
    }

    FocusScope.of(context).requestFocus(FocusNode());
    isSearching.value = false;
  }

  //GET INTERESANT CHARACTERS

  Future<void> getInteresantCharacters() async {
    isLoading.value = true;
    _interesatCharacters.clear();
    try {
      for (var i = 1; i < 4; i++) {
        final response = await characterProvider.getCharacterById(
          id: i.toString(),
        );
        _interesatCharacters.add(response.body!);

        update();
      }

      for (var i = 0; i < _interesatCharacters.length; i++) {
        Character findElement = _favouritesCharacters
            .firstWhere((element) => element.id == _interesatCharacters[i].id);
        _interesatCharacters
            .removeWhere((element) => element.id == findElement.id);
        _interesatCharacters.add(findElement);
      }
      _interesatCharacters.refresh();
    } catch (e) {
      log("$e");
    }
    isLoading.value = false;
  }

  void clearListCharacters(context) {
    _searchCharacters.clear();
  }

  //GET FAVOURITES CHARACTERS
  Future<void> getFavourites() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final _response = prefs.getString("favouritesCharacters");

      final List<dynamic> _mapResponse = jsonDecode(_response!);

      final List<Character> _listResponse =
          _mapResponse.map((e) => Character.fromJson(e)).toList();
      _favouritesCharacters.value = _listResponse;
    } catch (e) {
      log("$e");
    }
  }

  Character? findCharacter(int id) {
    try {
      return favouritesCharacters.firstWhere((book) => book.id == id);
    } catch (e) {
      log("$e");
    }
    return null;
  }

  addCharacterToList(Character character) {
    _favouritesCharacters.add(character);
  }

  removeCharacterToList(Character character) {
    _favouritesCharacters.removeWhere((element) => element.id == character.id);
  }

  refreshInteresantCharacter() {
    _interesatCharacters.refresh();
  }

  refreshFavouriteCharacter() {
    _favouritesCharacters.refresh();
  }
}
