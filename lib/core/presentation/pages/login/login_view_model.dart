import 'package:flutter/foundation.dart';
import 'package:todorr/core/data/models/user_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/entities/usecases/login_user_use_case.dart';
import 'package:todorr/core/domain/entities/usecases/register_user_use_case.dart';


class LoginViewModel extends ChangeNotifier {
  final RegisterUserUseCase _registerUserUseCase;
 final LoginUseCase _loginUseCase;
  LoginViewModel({
    RegisterUserUseCase? registerUserUseCase,
    LoginUseCase? loginUseCase,
  }) : _registerUserUseCase =
            registerUserUseCase ?? locator<RegisterUserUseCase>()
      , _loginUseCase = loginUseCase ?? locator<LoginUseCase>();

  Future<bool> registerUser(String email, String password) async {
    final bool registerSucces =
        await _registerUserUseCase.invoke(email, password).catchError((_) {
      return false;
    });
    if (registerSucces) {
      return true;
    } else {
      return false;
    }
  }

  Future<UserModel?> loginUser(String email, String password) async {
    try {
      final UserModel loginSuccess = await _loginUseCase.invoke(email, password);

      if (loginSuccess != null) {
        return loginSuccess;
      } else {
        return null;
      }
    } catch (e) {
     if (kDebugMode) {
       print(e);
     }
      return null;
    }
  }
}
