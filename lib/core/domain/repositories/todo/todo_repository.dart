import 'package:todorr/core/data/models/todo_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/repositories/todo/i_todo_repository.dart';
import 'package:todorr/core/domain/repositories/todo/todo_remote_data_source.dart';

class TodoRepository implements ITodoRepository{
final TodoRemotoDataSource _todoRemotoDataSource;
TodoRepository({
  TodoRemotoDataSource? todoRemotoDataSource
}): _todoRemotoDataSource=todoRemotoDataSource??locator<TodoRemotoDataSource>();

  @override
  Future<bool> createTodo(TodoModel todo) {
   return _todoRemotoDataSource.createTodo(todo);
  }

}