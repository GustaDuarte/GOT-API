import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../constants.dart';
import '../models/character.dart';

class CharacterService {
  Future<List<Character>> getCharacters() async {
    final response = await http.get(Uri.parse('$BASE_URL/Characters'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Character.fromJson(item)).toList();
    } else {
      throw Exception("Erro ao buscar os personagens");
    }
  }
}