import 'package:flutter/material.dart';
import 'package:flutter_api/views/pages/character_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/character_bloc/character_bloc.dart';
import 'bloc/character_bloc/character_event.dart';
import 'data/services/character_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => CharacterBloc(CharacterService())..add(LoadCharacters()),
        child: CharacterPage(),
      ),
    );
  }
}
