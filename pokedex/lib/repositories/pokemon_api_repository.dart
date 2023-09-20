import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repositories/pokemon_repository_interface.dart';

class PokemonApiRepository implements IPokemonRepository {
  final Dio _http = Dio();

  PokemonApiRepository();

  @override
  Future<List<PokemonModel>> getPokemons({int page = 0}) async {
    try {
      final response = await _http.get(
          'https://pokeapi.co/api/v2/pokemon?offset=${page * 20}&limit=20');
      final data = response.data as Map<String, dynamic>;
      final pokeList = data['results'] as List<dynamic>;

      if (pokeList.isEmpty) {
        return List.empty();
      }

      return pokeList.map(
        (e) {
          final id = _getIdByUrl(e['url'] as String);
          return PokemonModel(
            id: id,
            name: e['name'] as String,
            image: _getImageById(id),
            types: List<String>.empty(),
          );
        },
      ).toList();
    } catch (e) {
      print(e);
      return List.empty();
    }
  }

  int _getIdByUrl(String url) {
    final String preId = url.split('pokemon')[1];
    return int.tryParse(preId.substring(1, preId.length - 1)) ?? 0;
  }

  String _getImageById(int id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$id.svg';
  }
}
