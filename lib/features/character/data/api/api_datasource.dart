import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flutter_clean/features/character/data/datasources/remote_datasource.dart';
import 'package:flutter_clean/features/character/data/models/character_response.dart';
import 'package:flutter_clean/features/character/data/models/events_by_character_response.dart';
import 'package:flutter_clean/features/character/data/models/series_by_character_response.dart';
import 'package:flutter_clean/features/character/data/models/stories_by_character_response.dart';
import 'package:flutter_clean/features/character/data/models/comics_by_character_response.dart';
import 'package:flutter_clean/features/character/domain/entities/character.dart';
import 'package:flutter_clean/features/character/domain/entities/story.dart';
import 'package:flutter_clean/features/character/domain/entities/serie.dart';
import 'package:flutter_clean/features/character/domain/entities/event.dart';
import 'package:flutter_clean/features/character/domain/entities/comic.dart';
import 'package:flutter_clean/features/character/utils/api_url.dart';
import 'package:get/get_connect/connect.dart';

class ApiDataSource implements RemoteDataSource {
  

  final GetConnect connect = GetConnect();

  String _generateHash(int ts) {
    return md5
        .convert(utf8.encode("${ts.toString()}$privateKey$apiKey"))
        .toString();
  }

  @override
  Future<List<Character>?> getAllCharacters(int offset, int limit) async {
    final int time = DateTime.now().millisecondsSinceEpoch;
    final String hash = _generateHash(time);

    Response response = await connect.get(
        "$baseUrl/v1/public/characters?apikey=$apiKey&hash=$hash&ts=$time&offset=$offset&limit=$limit");

    if (response.isOk) {
      CharacterResponse data = CharacterResponse.fromJson(response.body);
      List<Character> characters =
          data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(characters);
    }

    return Future.value(null);
  }

  @override
  Future<List<Comic>?> getComics(int offset, int limit) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _generateHash(ts);

    Response response = await connect.get(
        "$baseUrl/v1/public/comics?apikey=$apiKey&hash=$hash&ts=$ts&offset=$offset&limit=$limit");

    if (response.isOk) {
      ComicsByCharacterResponse data =
          ComicsByCharacterResponse.fromJson(response.body);
      List<Comic> comics = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(comics);
    }

    return Future.value(null);
  }

  @override
  Future<List<Serie>?> getSeries(int offset, int limit) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _generateHash(ts);

    Response response = await connect.get(
        "$baseUrl/v1/public/series?apikey=$apiKey&hash=$hash&ts=$ts&offset=$offset&limit=$limit");

    if (response.isOk) {
      SeriesByCharacterResponse data =
          SeriesByCharacterResponse.fromJson(response.body);
      List<Serie> series = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(series);
    }

    return Future.value(null);
  }

  @override
  Future<Character?> getCharacterById(int id) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _generateHash(ts);

    Response response = await connect.get(
        "$baseUrl/v1/public/characters/$id?apikey=$apiKey&hash=$hash&ts=$ts");

    if (response.isOk) {
      CharacterResponse data = CharacterResponse.fromJson(response.body);
      Character character = data.data.results[0].toDomain();

      return Future.value(character);
    }

    return Future.value(null);
  }

  @override
  Future<List<Comic>?> getComicsBy({required int characterId}) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _generateHash(ts);

    Response response = await connect.get(
        "$baseUrl/v1/public/characters/$characterId/comics?apikey=$apiKey&hash=$hash&ts=$ts");

    if (response.isOk) {
      ComicsByCharacterResponse data =
          ComicsByCharacterResponse.fromJson(response.body);
      List<Comic> list = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(list);
    }

    return Future.value(null);
  }

  @override
  Future<List<Event>?> getEventsBy({required int characterId}) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _generateHash(ts);

    Response response = await connect.get(
        "$baseUrl/v1/public/characters/$characterId/events?apikey=$apiKey&hash=$hash&ts=$ts");

    if (response.isOk) {
      EventsByCharacterResponse data =
          EventsByCharacterResponse.fromJson(response.body);
      List<Event> list = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(list);
    }

    return Future.value(null);
  }

  @override
  Future<List<Serie>?> getSeriesBy({required int characterId}) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _generateHash(ts);

    Response response = await connect.get(
        "$baseUrl/v1/public/characters/$characterId/series?apikey=$apiKey&hash=$hash&ts=$ts");

    if (response.isOk) {
      SeriesByCharacterResponse data =
          SeriesByCharacterResponse.fromJson(response.body);
      List<Serie> list = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(list);
    }

    return Future.value(null);
  }

  @override
  Future<List<Story>?> getStoriesBy({required int characterId}) async {
    final int ts = DateTime.now().millisecondsSinceEpoch;
    final String hash = _generateHash(ts);

    Response response = await connect.get(
        "$baseUrl/v1/public/characters/$characterId/stories?apikey=$apiKey&hash=$hash&ts=$ts");

    if (response.isOk) {
      StoriesByCharacterResponse data =
          StoriesByCharacterResponse.fromJson(response.body);
      List<Story> list = data.data.results.map((e) => e.toDomain()).toList();

      return Future.value(list);
    }

    return Future.value(null);
  }
}
