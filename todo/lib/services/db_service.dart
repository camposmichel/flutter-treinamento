import 'dart:async';

import 'package:hive/hive.dart';

class DbService {
  final Box<String> box;

  DbService({required this.box});

  List<String> values() => box.values.toList();

  Future add(String data) async {
    await box.add(data);
    return;
  }

  Future delete(int index) async {
    await box.deleteAt(index);
    return;
  }

  Future putAt(int index, String data) async {
    await box.putAt(index, data);
    return;
  }
}
