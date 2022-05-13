// ignore_for_file: file_names, unused_import

import 'package:bloc_app/data/model/chatacter.dart';
import 'package:bloc_app/data/web_server/character_webservices.dart';
import 'package:flutter/cupertino.dart';

class CharacterRepository {
  final CharacterWebServices characterWebServices;

  CharacterRepository(this.characterWebServices);

  Future<List<Character>> getAllCharacters() async {
    final characters = await characterWebServices.getAllCharacters();
    return characters
        .map((character) => Character.fromJson(character))
        .toList();
  }
}
