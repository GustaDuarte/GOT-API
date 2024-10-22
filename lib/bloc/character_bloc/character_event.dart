abstract class CharacterEvent {}

class LoadCharacters extends CharacterEvent {}

class FilterCharacters extends CharacterEvent {
  final String filtro;

  FilterCharacters(this.filtro);
}
