
import 'package:todorr/core/data/models/todo_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/repositories/api/todo_api.dart';

class TodoRemotoDataSource  {
  final TodoApi _shoppingApi;

  TodoRemotoDataSource({
    TodoApi? shoppingApi,
  }) : _shoppingApi = shoppingApi ?? locator<TodoApi>();

  Future<bool> createTodo(TodoModel todo) async {
    return await  _shoppingApi.addTodo(todo);
  }
}