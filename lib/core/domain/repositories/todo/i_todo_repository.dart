import 'package:todorr/core/data/models/todo_model.dart';

abstract class ITodoRepository {
Future<bool> createTodo(TodoModel todo);

}