import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todorr/core/data/models/user_model.dart';
import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/usecases/get_current_user_use_case.dart';
import 'package:todorr/core/domain/usecases/logout_current_user.dart';


class HomeViewModel extends ChangeNotifier {
  final GetCurrentUserUseCase _getCurrentUserUseCase;
  final LogoutCurrentUserUseCase _logoutCurrentUserUseCase;
  UserModel? _user;

  HomeViewModel({
    GetCurrentUserUseCase? getCurrentUserUseCase,
    LogoutCurrentUserUseCase? logoutCurrentUserUseCase,
  
  })  : _logoutCurrentUserUseCase =
            logoutCurrentUserUseCase ?? locator<LogoutCurrentUserUseCase>(),
        _getCurrentUserUseCase =
            getCurrentUserUseCase ?? locator<GetCurrentUserUseCase>();

   UserModel get  userInfo => _getCurrentUserUseCase.invoke();

   set userInfo (UserModel user){
    _user=user;
    notifyListeners();
   }

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
