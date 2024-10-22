import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/character.dart';
import '../../data/services/character_service.dart';
import 'character_event.dart';
import 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  final CharacterService service;
  late List<Character> _personagens;

  CharacterBloc(this.service) : super(CharactersLoading()) {
    on<LoadCharacters>(_onLoadCharacters);
    on<FilterCharacters>(_onFilterCharacters);
  }

  Future<void> _onLoadCharacters(LoadCharacters event, Emitter<CharacterState> emit) async {
    try {
      _personagens = await service.getCharacters();
      emit(CharactersLoaded(_personagens));
    } catch (e) {
      emit(CharactersError(e.toString()));
    }
  }

  void _onFilterCharacters(FilterCharacters event, Emitter<CharacterState> emit) {
    if (_personagens.isEmpty) return;

    final filtered = _personagens
        .where((item) => item.fullName.toLowerCase().contains(event.filtro.toLowerCase()))
        .toList();

    emit(CharactersFiltered(filtered));
  }
}
