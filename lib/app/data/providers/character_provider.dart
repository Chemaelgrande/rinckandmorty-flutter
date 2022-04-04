import 'package:get/get.dart';
import 'package:rickandmorty/api.dart';
import 'package:rickandmorty/app/data/models/episode_model.dart';

import '../models/character_model.dart';

class CharacterProvider extends GetConnect {
  @override
  void onInit() {
    httpClient.defaultDecoder = (map) => Character.fromJson(map);
    httpClient.baseUrl = API.BASE_URL;
  }

  Future<Response<List<Character>>> getCharacterPage({
    int? pageNumber,
  }) async =>
      await get(
        'character/',
        query: {
          'page': '$pageNumber',
        },
        decoder: (list) => list['results']
            .map<Character>((e) => Character.fromJson(e))
            .toList(),
      );

  Future<Response<List<Character>>> getCharacterName({
    String? name,
  }) async =>
      await get(
        'character/',
        query: {
          'name': name,
        },
        decoder: (list) => list['results']
            .map<Character>((e) => Character.fromJson(e))
            .toList(),
      );

  Future<Response<List<Character>>> getCharacterByCategory({
    String? status,
    String? gender,
    String? name,
  }) async =>
      await get(
        'character/',
        query: {
          'name': '$name',
          'status': '$status',
          'gender': '$gender',
        },
        decoder: (list) => list['results']
            .map<Character>((e) => Character.fromJson(e))
            .toList(),
      );

  Future<Response<Character>> getCharacterById({
    String? id,
  }) async =>
      await get('character/$id', decoder: (data) => Character.fromJson(data));
}
