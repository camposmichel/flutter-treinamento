import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/cubits/todo/todo_cubit.dart';

class CubitProvivers {
  static final List<BlocProvider> instancies = [
    BlocProvider<TodoCubit>(create: (_) => TodoCubit()),
  ];
}
