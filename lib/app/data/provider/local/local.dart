import 'package:hive_flutter/hive_flutter.dart';

mixin MapDataSource<T> {
  String get storageKey;
  T? get();
  Future<void> add({required T data});
  Future<void> delete();
}

abstract class MapLocal<T> with MapDataSource<T> {
  MapLocal({required Box<T> database}) : _database = database;

  final Box<T> _database;

  String get storageKey => "${T.toString()}-map-storage";

  @override
  T? get() {
    return _database.get(storageKey);
  }

  @override
  Future<void> add({required T data}) {
    return _database.put(storageKey, data);
  }

  @override
  Future<void> delete() {
    return _database.delete(storageKey);
  }
}

mixin ListDataSource<T> {
  T? get({required int index});
  List<T> getAll();
  Future<int> add({int? index, required T value});
  Future<List<int>> addAll({required List<T> values});
  Future<int> update({required int index, required T value});
  Future<void> delete({required int index});
}

abstract class ListLocal<T> with ListDataSource<T> {
  ListLocal({required Box<T> database}) : _database = database;

  final Box<T> _database;

  T? get({required int index}) {
    return _database.get(index);
  }

  List<T> getAll() {
    return _database.values.toList();
  }

  Future<int> add({int? index, required T value}) async {
    if (index == null) {
      return _database.add(value);
    } else {
      await _database.putAt(index, value);
      return index;
    }
  }

  Future<List<int>> addAll({required List<T> values}) async {
    return (await _database.addAll(values)).toList();
  }

  Future<int> update({required int index, required T value}) async {
    await delete(index: index);
    return add(index: index, value: value);
  }

  Future<void> delete({required int index}) {
    return _database.delete(index);
  }
}
