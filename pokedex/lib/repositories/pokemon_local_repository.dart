import 'package:dio/dio.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repositories/pokemon_repository_interface.dart';

class PokemonLocalRepository implements IPokemonRepository {
  final Dio _http = Dio();

  PokemonLocalRepository();

  @override
  Future<List<PokemonModel>> getPokemons({int page = 0}) async {
    try {
      final response = await _http
          .get('http://192.168.0.105:3000/pokemons?_page=$page&_limit=20');
      final pokeList = response.data as List<dynamic>;

      if (pokeList.isEmpty) {
        return List.empty();
      }

      return pokeList.map(
        (e) {
          final id = e['id'] as int;
          return PokemonModel(
            id: id,
            name: e['name'] as String,
            image: _getImageById(id),
            types: (e['type'] as List<dynamic>).cast<String>(),
          );
        },
      ).toList();
    } catch (e) {
      print(e);
      return List.empty();
    }
  }

  String _getImageById(int id) {
    return 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/$id.svg';
  }
}
