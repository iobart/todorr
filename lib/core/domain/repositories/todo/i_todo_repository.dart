import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todorr/core/data/dtos/todo_model_dto.dart';
import 'package:todorr/core/data/models/todo_model.dart';

abstract class ITodoRepository {
Future<bool> createTodo(TodoModel todo);
Stream<QuerySnapshot<TodoModelDto>>? getListTodo();

}