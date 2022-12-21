import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'dart:developer' as dev;

class LockScreenController extends GetxController {
  bool? fingerprint = false.obs();
  bool? faceID = false.obs();
  String? password = ''.obs();
  initLookScreen() async {
    var prefs = await SharedPreferences.getInstance();
    fingerprint = prefs.getBool('fingerPrint') ?? false.obs();
    faceID = prefs.getBool('faceID') ?? false.obs();
    password = prefs.getString('password') ?? ''.obs();
    dev.log(password.toString());
    update();
  }

  chekFingerPrin(bool? value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool('fingerPrint', value!);
    fingerprint = value;
    update();
  }

  checkFaceID(bool? value) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setBool('faceID', value!);
    faceID = value;
    update();
  }

  setupPassword(String? password) async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.setString('password', password!);

    await initLookScreen();

    update();
  }
}
