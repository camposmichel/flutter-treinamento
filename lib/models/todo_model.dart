class TodoModel {
  final String id;
  final String title;
  bool isChecked;
  final String? description;

  TodoModel({
    required this.id,
    required this.title,
    this.isChecked = false,
    this.description,
  });
}
