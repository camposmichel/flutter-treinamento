part of 'pokemon_cubit.dart';

class PokemonState {
  final int page;
  final List<PokemonModel> list;
  final bool? loading;
  PokemonState({
    this.page = 1,
    this.list = const [],
    this.loading,
  });

  PokemonState copyWith({
    int? page,
    List<PokemonModel>? list,
    bool? loading,
  }) {
    return PokemonState(
      page: page ?? this.page,
      list: list ?? this.list,
      loading: loading,
    );
  }
}
