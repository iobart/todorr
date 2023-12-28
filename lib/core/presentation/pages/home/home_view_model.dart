
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:todorr/core/data/dtos/todo_model_dto.dart';
import 'package:todorr/core/data/models/user_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/entities/usecases/get_current_user_use_case.dart';
import 'package:todorr/core/domain/entities/usecases/get_todo_list_use_case.dart';
import 'package:todorr/core/domain/entities/usecases/logout_current_user.dart';


class HomeViewModel extends ChangeNotifier {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final LogoutCurrentUserUseCase _logoutCurrentUserUseCase;
  final GetTodoListUseCase _getTodoListUseCase;
  UserModel? _user;

  HomeViewModel({
    GetCurrentUserUseCase? getCurrentUserUseCase,
    LogoutCurrentUserUseCase? logoutCurrentUserUseCase,
    GetTodoListUseCase? getTodoListUseCase
  
  })  : _logoutCurrentUserUseCase =
            logoutCurrentUserUseCase ?? locator<LogoutCurrentUserUseCase>(),
            _getTodoListUseCase=getTodoListUseCase??locator<GetTodoListUseCase>(),
        _getCurrentUserUseCase =
            getCurrentUserUseCase ?? locator<GetCurrentUserUseCase>();

   UserModel get  userInfo => _getCurrentUserUseCase.invoke();

   set userInfo (UserModel user){
    _user=user;
    notifyListeners();
   }
///Stream list todo 
Stream<QuerySnapshot<TodoModelDto>>? get getTodoList => _getTodoListUseCase.invoke();

///end session current user .
   void logout() {
    try {
      _logoutCurrentUserUseCase.invoke();
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
