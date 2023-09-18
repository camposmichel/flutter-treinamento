import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/cubits/todo/todo_cubit.dart';
import 'package:todo/models/todo_model.dart';
import 'package:todo/ui/app_theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<TodoCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: openCreateModal,
          ),
        ],
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (_, state) {
          if (state.list.isEmpty) {
            return emptyList;
          }

          return ListView.builder(
            itemCount: state.list.length,
            itemBuilder: (_, int index) {
              final todo = state.list[index];
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                  color: Colors.white,
                ),
                child: ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.description ?? ''),
                  leading: Checkbox(
                    value: todo.isChecked,
                    onChanged: (value) =>
                        context.read<TodoCubit>().toggle(todo.id),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => openConfirmDelete(todo),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget get emptyList {
    return SizedBox(
      width: double.maxFinite,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset('assets/animations/empty.json'),
          Text(
            'Nenhum item cadastrado',
            style: TextStyle(color: AppTheme.primaryColor),
          ),
        ],
      ),
    );
  }

  void openCreateModal() {
    final titleCtrl = TextEditingController();
    final descriptionCtrl = TextEditingController();

    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          height: 240,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Column(
            children: [
              TextField(
                controller: titleCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: descriptionCtrl,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.maxFinite,
                height: 40,
                child: ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () {
                    Navigator.pop(_);
                    context
                        .read<TodoCubit>() //
                        .add(
                          title: titleCtrl.text,
                          description: descriptionCtrl.text,
                        );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void openConfirmDelete(TodoModel todo) {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Delete Todo'),
          content: const Text('Are you sure you want to delete this todo?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(_),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<TodoCubit>().remove(todo.id);
                Navigator.pop(_);
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
