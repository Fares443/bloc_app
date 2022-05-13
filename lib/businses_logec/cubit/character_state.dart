part of 'character_cubit.dart';

@immutable
abstract class CharactersState {}

class CreactInitial extends CharactersState {}

class CharatersLoaded extends CharactersState {
  final List<Character> characters;
  CharatersLoaded(this.characters);
}
