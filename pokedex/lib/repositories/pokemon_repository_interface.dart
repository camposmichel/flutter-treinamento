import 'package:pokedex/models/pokemon_model.dart';

abstract class IPokemonRepository {
  Future<List<PokemonModel>> getPokemons({int page = 0});
}
