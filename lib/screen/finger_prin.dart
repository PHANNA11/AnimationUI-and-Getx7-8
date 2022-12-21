import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:fruits/Auth/local_auth.dart';
import 'package:fruits/controller/lock_screen_controller.dart';
import 'package:fruits/screen/home_screen.dart';
import 'package:fruits/screen/setuppassword_screen.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FingerPrin extends StatefulWidget {
  const FingerPrin({super.key});

  @override
  State<FingerPrin> createState() => _FingerPrinState();
}

class _FingerPrinState extends State<FingerPrin> {
  LockScreenController lockScreenController = Get.put(LockScreenController());
  final inputController = InputController();
  Future<void> localAuth(BuildContext context) async {
    final localAuth = LocalAuthentication();
    final didAuthenticate =
        await localAuth.authenticate(localizedReason: 'Please authenticate');
    if (didAuthenticate) {
      Navigator.pop(context);
    }
  }

  initStatePassword() async {
    await lockScreenController.initLookScreen();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // initStatePassword();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: lockScreenController,
        builder: (controller) {
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            body: Container(
              alignment: Alignment.center,
              height: double.infinity,
              width: double.infinity,
              color: Colors.blueGrey,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
                  child: lockScreenController.password != ''
                      ? ScreenLock(
                          correctString: lockScreenController.password!,
                          //  confirmation: true,
                          onUnlocked: () async {
                            Navigator.pop(context);
                          },
                          customizedButtonChild: const Icon(
                            Icons.fingerprint,
                            size: 50,
                          ),
                          customizedButtonTap: () async {
                            var prefs = await SharedPreferences.getInstance();
                            if (prefs.getBool('fingerPrint')!) {
                              // ignore: use_build_context_synchronously
                              await localAuth(context);
                            }
                          },

                          onOpened: () async {
                            var prefs = await SharedPreferences.getInstance();
                            bool? checkFingerPrin =
                                prefs.getBool('fingerPrint');
                            if (checkFingerPrin == true) {
                              // ignore: use_build_context_synchronously
                              await localAuth(context);
                            }
                          },
                          inputController: inputController,
                        )
                      : const SetUpPasswordScreen(),
                ),
              ),
            ),
          );
        });
  }
}
