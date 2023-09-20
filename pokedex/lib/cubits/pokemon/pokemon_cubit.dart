import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon_model.dart';
import 'package:pokedex/repositories/pokemon_repository_interface.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final IPokemonRepository repository;

  PokemonCubit(this.repository) : super(PokemonState());

  load() async {
    emit(state.copyWith(loading: true));
    final List<PokemonModel> response = await repository.getPokemons(
      page: state.page,
    );
    emit(
      state.copyWith(
        page: state.page + 1,
        list: [...state.list, ...response],
        loading: false,
      ),
    );
  }
}
