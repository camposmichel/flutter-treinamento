import 'package:graphql/client.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repositories/pokemon_repository_interface.dart';

class PokemonGraphqlRepository implements IPokemonRepository {
  final GraphQLClient _client = GraphQLClient(
    link: HttpLink('https://beta.pokeapi.co/graphql/v1beta'),
    cache: GraphQLCache(),
  );

  PokemonGraphqlRepository();

  @override
  Future<List<PokemonModel>> getPokemons({int page = 0}) async {
    try {
      const String query = r'''
        query pokemonListQuery($offset: Int!) {
          pokemons: pokemon_v2_pokemon(offset: $offset, limit: 20, order_by: {id: asc}) {
            id
            name
            types: pokemon_v2_pokemontypes {
              type: pokemon_v2_type {
                name
              }
            }
          }
        }
      ''';

      final QueryResult response = await _client.query(QueryOptions(
        document: gql(query),
        variables: {'offset': page * 20},
      ));

      if (response.data == null) return List.empty();

      final data = response.data as Map<String, dynamic>;
      final pokeList = data['pokemons'] as List<dynamic>;

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
            types: (e['types'] as List<dynamic>)
                .map((type) => type['type']['name'] as String)
                .toList(),
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
