import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/ui/app_theme.dart';

class PokeTypeHelper {
  static Color getColorByType(String type) {
    switch (type) {
      case 'normal':
        return AppTheme.pkNormalColor;
      case 'fighting':
        return AppTheme.pkFightingColor;
      case 'flying':
        return AppTheme.pkFlyingColor;
      case 'poison':
        return AppTheme.pkPoisonColor;
      case 'ground':
        return AppTheme.pkGroundColor;
      case 'rock':
        return AppTheme.pkRockColor;
      case 'bug':
        return AppTheme.pkBugColor;
      case 'ghost':
        return AppTheme.pkGhostColor;
      case 'steel':
        return AppTheme.pkSteelColor;
      case 'fire':
        return AppTheme.pkFireColor;
      case 'water':
        return AppTheme.pkWaterColor;
      case 'grass':
        return AppTheme.pkGrassColor;
      case 'electric':
        return AppTheme.pkElectricColor;
      case 'psychic':
        return AppTheme.pkPsychicColor;
      case 'ice':
        return AppTheme.pkIceColor;
      case 'dragon':
        return AppTheme.pkDragonColor;
      case 'dark':
        return AppTheme.pkDarkColor;
      case 'fairy':
        return AppTheme.pkFairyColor;
      case 'unknown':
        return AppTheme.pkUnknownColor;
      case 'shadow':
        return AppTheme.pkShadowColor;
      default:
        return AppTheme.pkNormalColor;
    }
  }

  static LinearGradient? getGradientByPokemon(PokemonModel pokemon) {
    final List<Color> typesColors = [];

    for (var e in pokemon.types) {
      typesColors.add(getColorByType(e));
    }

    if (typesColors.length == 1) {
      typesColors.add(typesColors.first);
    }

    if (typesColors.isEmpty) {
      return null;
    }

    return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: typesColors,
    );
  }
}
