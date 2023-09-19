import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pokedex/helpers/poketype_helper.dart';
import 'package:pokedex/ui/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 40,
          child: Image.asset('assets/images/pokedex_logo.png'),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, index) {
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  PokeTypeHelper.getColorByType('grass'),
                  PokeTypeHelper.getColorByType('poison'),
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 10,
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
                  SvgPicture.network(
                    'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/dream-world/1.svg',
                    height: 200,
                    placeholderBuilder: (BuildContext context) => Container(
                      padding: const EdgeInsets.all(30.0),
                      child: const CircularProgressIndicator(),
                    ),
                  ),
                  Text(
                    '#0001 - Bulbasauro',
                    style: TextStyle(
                      color: AppTheme.itemTitle,
                      fontFamily: 'PokemonGb',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _pokeType(),
                      _pokeType(),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _pokeType() {
    return SizedBox(
      height: 60,
      width: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 40,
            child: Image.asset(
              'assets/images/poketypes/normal.png',
              color: AppTheme.itemTitle,
            ),
          ),
          Text(
            'normal',
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
