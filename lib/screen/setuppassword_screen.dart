import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screen_lock/flutter_screen_lock.dart';
import 'package:fruits/Auth/local_auth.dart';
import 'package:fruits/controller/lock_screen_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetUpPasswordScreen extends StatefulWidget {
  const SetUpPasswordScreen({super.key});

  @override
  State<SetUpPasswordScreen> createState() => _SetUpPasswordScreenState();
}

class _SetUpPasswordScreenState extends State<SetUpPasswordScreen> {
  // initScan() async {
  //   final isAuth = await LocalAuth().authentcate();
  //   if (isAuth) {
  //     Navigator.pop(context);
  //   }
  // }

  Future<void> localAuth(BuildContext context) async {
    final localAuth = LocalAuthentication();
    final didAuthenticate =
        await localAuth.authenticate(localizedReason: 'Please authenticate');
    if (didAuthenticate) {
      Navigator.pop(context);
    }
  }

  LockScreenController lockScreenController = Get.put(LockScreenController());
  final inputController = InputController();

  initStatePassword() async {
    await lockScreenController.initLookScreen();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initStatePassword();
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
                  child: ScreenLock(
                    correctString: lockScreenController.password!,
                    //  confirmation: true,
                    // didConfirmed: (matchedText) async {
                    //   await lockScreenController.setupPassword(matchedText);
                    // },
                    title: const Text('Please setup password'),
                    onUnlocked: () async {
                      Navigator.pop(context);
                    },
                    inputController: inputController,
                  ),
                ),
              ),
            ),
          );
        });
  }
}
