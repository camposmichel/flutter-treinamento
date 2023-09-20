import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/helpers/poketype_helper.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/ui/app_theme.dart';

class PokeCardWidget extends StatelessWidget {
  final PokemonModel pokemon;

  const PokeCardWidget({
    super.key,
    required this.pokemon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: PokeTypeHelper.getGradientByPokemon(pokemon),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            _getPokemonImage(),
            const SizedBox(height: 8),
            _getPokemonName(),
            const SizedBox(height: 8),
            _getPokemonTypes(),
          ],
        ),
      ),
    );
  }

  Widget _getPokemonImage() {
    return SvgPicture.network(
      pokemon.image,
      height: 200,
      placeholderBuilder: (_) => Container(
        padding: const EdgeInsets.all(30.0),
        child: const CircularProgressIndicator(),
      ),
    );
  }

  Widget _getPokemonName() {
    return Text(
      '#${pokemon.id} - ${pokemon.name}',
      style: TextStyle(
        color: AppTheme.itemTitle,
        fontFamily: 'PokemonGb',
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _getPokemonTypes() {
    final List<Widget> types = pokemon.types.map((e) => _pokeType(e)).toList();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: types,
    );
  }

  Widget _pokeType(String type) {
    return SizedBox(
      height: 60,
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: Image.asset(
              'assets/images/poketypes/$type.png',
              color: AppTheme.itemTitle,
            ),
          ),
          Text(
            type,
            style: TextStyle(
              color: AppTheme.itemTitle,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
