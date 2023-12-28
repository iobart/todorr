
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todorr/core/data/dtos/todo_model_dto.dart';
import 'package:todorr/core/data/models/todo_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/repositories/api/todo_api.dart';

class TodoRemotoDataSource  {
  final TodoApi _todoApi;

  TodoRemotoDataSource({
    TodoApi? todoApi,
  }) : _todoApi = todoApi ?? locator<TodoApi>();

  Future<bool> createTodo(TodoModel todo) async {
    return await  _todoApi.addTodo(todo);
  }

    Stream<QuerySnapshot<TodoModelDto>>? getListTodo(){
    return _todoApi.getListTodo();
  }

  Future<bool> updateTodo(String docId,TodoModel todo){
    return _todoApi.updateTodo(docId,todo);
  }

  Future<bool> deleteTodo(String docId){
    return _todoApi.deleTodo(docId);
  }
}