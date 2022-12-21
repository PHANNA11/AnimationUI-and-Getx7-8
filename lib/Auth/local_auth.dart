import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:local_auth_android/local_auth_android.dart';

class LocalAuth {
  LocalAuthentication localAuth = LocalAuthentication();

  Future<bool> hasEnrolledBiometrics() async {
    List<BiometricType> availableBiometrics =
        await localAuth.getAvailableBiometrics();

    if (availableBiometrics.isNotEmpty) {
      return true;
    }

    return false;
  }

  Future<bool> authentcate() async {
    final bool didAuthenticate = await localAuth.authenticate(
        localizedReason: 'Please Scan to Process',
        authMessages: <AuthMessages>[
          AndroidAuthMessages(
            signInTitle: 'Oops! Biometric authentication required!',
            cancelButton: 'No thanks',
          ),
          IOSAuthMessages(
            cancelButton: 'No thanks',
          ),
        ],
        options: const AuthenticationOptions(
            biometricOnly: true, stickyAuth: true, useErrorDialogs: false));
    return didAuthenticate;
  }

  Future<List<BiometricType>> getBiometrics() async {
    try {
      return await localAuth.getAvailableBiometrics();

      // ignore: nullable_type_in_catch_clause
    } on PlatformException {
      return <BiometricType>[];
    }
  }
}
