import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo/ui/app_theme.dart';

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
        title: const Text('Todo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: openCreateModal,
          ),
        ],
      ),
      // body: emptyList,
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (_, int index) {
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
              title: Text('Todo $index'),
              subtitle: Text('Description $index'),
              leading: Checkbox(
                value: false,
                onChanged: (value) {},
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: openConfirmDelete,
              ),
            ),
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
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Title',
                ),
              ),
              const SizedBox(height: 16),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.maxFinite,
                height: 40,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Create'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void openConfirmDelete() {
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          title: const Text('Delete Todo'),
          content: const Text('Are you sure you want to delete this todo?'),
          actions: [
            TextButton(
              onPressed: () {},
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}
