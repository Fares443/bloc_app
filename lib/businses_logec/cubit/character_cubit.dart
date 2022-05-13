import 'package:bloc/bloc.dart';
import 'package:bloc_app/data/model/chatacter.dart';
import 'package:meta/meta.dart';

import '../../data/repstry/character_Repository.dart';

part 'character_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharacterRepository characterRepository;
  List<Character> characters = [];
  CharactersCubit(this.characterRepository) : super(CreactInitial());

  List<Character> getAllCharacters() {
    characterRepository.getAllCharacters().then((characters) {
      emit(CharatersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }
}
