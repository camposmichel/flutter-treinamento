part of 'todo_cubit.dart';

class TodoState {
  final List<TodoModel> list;

  TodoState({
    this.list = const [],
  });

  TodoState copyWith({List<TodoModel>? list}) {
    return TodoState(
      list: list ?? this.list,
    );
  }
}
