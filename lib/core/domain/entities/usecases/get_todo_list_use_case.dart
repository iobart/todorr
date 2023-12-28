import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todorr/core/data/dtos/todo_model_dto.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/repositories/todo/i_todo_repository.dart';

class GetTodoListUseCase{
  final ITodoRepository _iTodoRepository;
  GetTodoListUseCase({
    ITodoRepository? iTodoRepository
  }):_iTodoRepository=iTodoRepository??locator<ITodoRepository>();

  Stream<QuerySnapshot<TodoModelDto>>? invoke()  {
    return  _iTodoRepository.getListTodo();
  }
}