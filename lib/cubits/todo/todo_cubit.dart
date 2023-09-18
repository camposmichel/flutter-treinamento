import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/services/db_service.dart';
import 'package:uuid/uuid.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final DbService dbService;

  TodoCubit({required this.dbService}) : super(TodoState());

  void load() {
    emit(
      state.copyWith(
        list: dbService.values().map((e) => TodoModel.fromJson(e)).toList(),
      ),
    );
  }

  void add({
    required String title,
    String? description,
  }) {
    final newItem = TodoModel(
      id: const Uuid().v1(),
      title: title,
      description: description,
    );
    dbService.add(newItem.toJson());
    emit(state.copyWith(list: [...state.list, newItem]));
  }

  void remove(String id) {
    final index = state.list.indexWhere((e) => e.id == id);
    state.list.removeAt(index);
    dbService.delete(index);
    emit(state.copyWith(list: state.list));
  }

  void toggle(String id) {
    final index = state.list.indexWhere((e) => e.id == id);
    final item = state.list[index];
    item.isChecked = !item.isChecked;
    state.list[index] = item;
    dbService.putAt(index, item.toJson());
    emit(state.copyWith(list: state.list));
  }
}
