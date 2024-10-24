import 'package:flutter/material.dart';
import '../../data/models/character.dart';
import 'character_image.dart';

class CharacterTile extends StatelessWidget {
  final Character character;

  const CharacterTile({Key? key, required this.character}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(character.fullName, style: TextStyle(fontFamily: 'Got'),),
      leading: CharacterImage(
        imageUrl: character.imageUrl,
      ),
    );
  }
}
