import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:todo/cubits/todo/todo_cubit.dart';
import 'package:todo/services/db_service.dart';

class CubitProvivers {
  static final List<BlocProvider> instancies = [
    BlocProvider<TodoCubit>(
      create: (_) => TodoCubit(
        dbService: GetIt.instance.get<DbService>(),
      ),
    ),
  ];
}
