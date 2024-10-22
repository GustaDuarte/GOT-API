import '../../data/models/character.dart';

abstract class CharacterState {}

class CharactersLoading extends CharacterState {}

class CharactersLoaded extends CharacterState {
  final List<Character> personagens;

  CharactersLoaded(this.personagens);
}

class CharactersError extends CharacterState {
  final String message;

  CharactersError(this.message);
}

class CharactersFiltered extends CharacterState {
  final List<Character> personagensFiltrados;

  CharactersFiltered(this.personagensFiltrados);
}
