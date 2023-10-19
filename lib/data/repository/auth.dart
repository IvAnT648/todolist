
import 'package:local_auth/local_auth.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/error_codes.dart' as local_auth_error;

import 'interface.dart';

class AuthRepositoryImpl implements AuthRepository {
  final _localAuthentication = LocalAuthentication();

  @override
  Future<bool> authorizeLocal() async {
    try {
      return await _localAuthentication.authenticate(
        localizedReason: 'Please authenticate',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: false,
        ),
      );
    } on PlatformException catch (e) {
      if (e.code == local_auth_error.notAvailable ||
          e.code == local_auth_error.passcodeNotSet ||
          e.code == local_auth_error.notEnrolled) {
        // Handle this exception here.
      }
      return false;
    }
  }
}
