import 'package:get_it/get_it.dart';
import 'package:todorr/core/domain/entities/usecases/create_todo_use_case.dart';
import 'package:todorr/core/domain/entities/usecases/delete_todo_use_case.dart';
import 'package:todorr/core/domain/entities/usecases/get_todo_list_use_case.dart';
import 'package:todorr/core/domain/entities/usecases/update_current_todo_use_case.dart';
import 'package:todorr/core/domain/repositories/api/todo_api.dart';
import 'package:todorr/core/domain/repositories/todo/i_todo_repository.dart';
import 'package:todorr/core/domain/repositories/todo/todo_remote_data_source.dart';
import 'package:todorr/core/domain/repositories/todo/todo_repository.dart';
import 'package:todorr/core/domain/repositories/user/i_user_repository.dart';
import 'package:todorr/core/domain/repositories/user/user_local_data_source.dart';
import 'package:todorr/core/domain/repositories/user/user_remote_data_source.dart';
import 'package:todorr/core/domain/repositories/user/user_repository.dart';
import 'package:todorr/core/domain/entities/usecases/get_current_user_use_case.dart';
import 'package:todorr/core/domain/entities/usecases/login_user_use_case.dart';
import 'package:todorr/core/domain/entities/usecases/logout_current_user.dart';
import 'package:todorr/core/domain/entities/usecases/register_user_use_case.dart';
import 'package:todorr/core/presentation/pages/form/form_view_model.dart';
import 'package:todorr/core/presentation/pages/home/home_view_model.dart';
import 'package:todorr/core/presentation/pages/login/login_view_model.dart';

/// The service locator instance that contains all LazySingletons that will be reused
/// across the application.
GetIt locator = GetIt.instance..allowReassignment = true;

void setUpLocator() {
  // Apis
  locator
    ..registerLazySingleton<TodoApi>(() => TodoApi())
    // View Models
    ..registerLazySingleton<LoginViewModel>(() => LoginViewModel())
    ..registerLazySingleton<HomeViewModel>(() => HomeViewModel())
    ..registerLazySingleton<FormViewModel>(() => FormViewModel())
   

    //User Cases
    ..registerLazySingleton<RegisterUserUseCase>(() => RegisterUserUseCase())
    ..registerLazySingleton<LoginUseCase>(() => LoginUseCase())
    ..registerLazySingleton<LogoutCurrentUserUseCase>(() => LogoutCurrentUserUseCase())
    ..registerLazySingleton<GetCurrentUserUseCase>(() => GetCurrentUserUseCase())
    ..registerLazySingleton<CreateTodoUseCase>(() => CreateTodoUseCase())
    ..registerLazySingleton<GetTodoListUseCase>(()=>GetTodoListUseCase())
    ..registerLazySingleton<UpdateCurrentTodoUseCase>(() => UpdateCurrentTodoUseCase())
    ..registerLazySingleton<DeleteCurrentTodoUseCase>(() => DeleteCurrentTodoUseCase())
    //repositories
    ..registerLazySingleton<IUserRepository>(() => UserRepository())
    ..registerLazySingleton<ITodoRepository>(() => TodoRepository())

    //data sources
    ..registerLazySingleton<UserRemotoDataSource>(() => UserRemotoDataSource())
    ..registerLazySingleton<UserLocalDataSource>(() => UserLocalDataSource())
   ..registerLazySingleton<TodoRemotoDataSource>(()=>TodoRemotoDataSource());
}
