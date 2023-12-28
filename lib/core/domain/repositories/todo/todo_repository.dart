import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todorr/core/data/dtos/todo_model_dto.dart';
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

  @override
  Stream<QuerySnapshot<TodoModelDto>>? getListTodo() {
  return _todoRemotoDataSource.getListTodo();
  }
  
  @override
  Future<bool> updateTodo(String docId,TodoModel todo) {
    
    return _todoRemotoDataSource.updateTodo(docId,todo);
  }
  
  @override
  Future<bool> deleteTodo(String docId) {
    return _todoRemotoDataSource.deleteTodo(docId);
  }

}