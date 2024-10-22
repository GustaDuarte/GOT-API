import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/character_bloc/character_bloc.dart';
import '../../bloc/character_bloc/character_event.dart';
import '../../bloc/character_bloc/character_state.dart';
import '../widgets/character_tile.dart';

class CharacterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Game of Thrones API",
        style: TextStyle(fontFamily: 'Got'),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              onChanged: (value) {
                context.read<CharacterBloc>().add(FilterCharacters(value));
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Filtro",
              ),
            ),
          ),
          BlocBuilder<CharacterBloc, CharacterState>(
            builder: (context, state) {
              if (state is CharactersLoading) {
                return Center(child: CircularProgressIndicator());
              } else if (state is CharactersError) {
                return Center(child: Text("Erro: ${state.message}"));
              } else if (state is CharactersLoaded || state is CharactersFiltered) {
                final personagens = state is CharactersFiltered
                    ? state.personagensFiltrados
                    : (state as CharactersLoaded).personagens;

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView.separated(
                      itemBuilder: (context, index) {
                        return CharacterTile(character: personagens[index]); // Usando o widget CharacterTile
                      },
                      separatorBuilder: (context, index) {
                        return Divider();
                      },
                      itemCount: personagens.length,
                    ),
                  ),
                );
              }
              return Container(); // Caso padrão
            },
          ),
        ],
      ),
    );
  }
}
