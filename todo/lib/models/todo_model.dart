import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'isChecked': isChecked,
      'description': description,
    };
  }

  factory TodoModel.fromMap(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'] as String,
      title: map['title'] as String,
      isChecked: map['isChecked'] as bool,
      description:
          map['description'] != null ? map['description'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModel.fromJson(String source) =>
      TodoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
