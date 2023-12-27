

import 'package:todorr/core/di/locator.dart';
import 'package:todorr/core/domain/repositories/user/i_user_repository.dart';

class LogoutCurrentUserUseCase {
  final IUserRepository _iUserRepository;

  LogoutCurrentUserUseCase({IUserRepository? iUserRepository})
      : _iUserRepository = iUserRepository ?? locator<IUserRepository>();

  Future<void> invoke() async {
    return _iUserRepository.logoutUser();

  }
}