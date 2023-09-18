import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo_model.dart';
import 'package:uuid/uuid.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState());

  void add({
    required String title,
    String? description,
  }) {
    emit(
      state.copyWith(
        list: [
          ...state.list,
          TodoModel(
            id: const Uuid().v1(),
            title: title,
            description: description,
          )
        ],
      ),
    );
  }

  void remove(String id) {
    state.list.removeWhere((e) => e.id == id);
    emit(state.copyWith(list: state.list));
  }

  void toggle(String id) {
    final index = state.list.indexWhere((e) => e.id == id);
    state.list[index].isChecked = !state.list[index].isChecked;
    emit(state.copyWith(list: state.list));
  }
}
