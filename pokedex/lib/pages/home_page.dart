import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/cubits/pokemon/pokemon_cubit.dart';
import 'package:pokedex/ui/widgets/pokecard_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<PokemonCubit>().load();
    _buildScrollListener();
  }

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
        elevation: 0,
      ),
      body: BlocBuilder<PokemonCubit, PokemonState>(
        builder: (_, state) {
          return ListView.builder(
            controller: scrollController,
            itemCount: state.list.length,
            itemBuilder: (_, index) {
              final pokemon = state.list[index];
              return PokeCardWidget(pokemon: pokemon);
            },
          );
        },
      ),
    );
  }

  _buildScrollListener() {
    scrollController.addListener(
      () {
        if (scrollController.offset >=
                scrollController.position.maxScrollExtent &&
            !scrollController.position.outOfRange) {
          context.read<PokemonCubit>().load();
        }
      },
    );
  }
}
